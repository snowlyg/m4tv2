import asyncio
import logging
import wave

from dotenv import load_dotenv
from livekit import rtc
from livekit.agents import (
    AutoSubscribe,
    JobContext,
    WorkerOptions,
    cli,
    stt,
    transcription,
    JobProcess,
)
from livekit.plugins import silero
from livekit.agents import stt
from livekit.agents.stt import StreamAdapter
from livekit.agents.utils import AudioBuffer
from gradio_client import Client
from gradio_client import handle_file
import tempfile

load_dotenv()

logger = logging.getLogger("m4t-translate-demo")
logger.setLevel(logging.INFO)

from livekit.agents import Plugin

__version__ = "0.0.1"

class M4tPlugin(Plugin):
    def __init__(self):
        super().__init__(__name__, __version__, __package__, logger)

Plugin.register_plugin(M4tPlugin())

async def _forward_transcription(
    stt_stream: stt.SpeechStream, stt_forwarder: transcription.STTSegmentsForwarder
):
    """Forward the transcription to the client and log the transcript in the console"""
    async for ev in stt_stream:
        stt_forwarder.update(ev)
        if ev.type == stt.SpeechEventType.INTERIM_TRANSCRIPT:
            print(ev.alternatives[0].text, end="")
        elif ev.type == stt.SpeechEventType.FINAL_TRANSCRIPT:
            print("\\n")
            print(" -> ", ev.alternatives[0].text)

class M4tTranslate(stt.STT):
    def __init__(self) -> None:
        self.client =  Client("http://10.0.0.99:7860")  # connecting to a Hugging Face Space
        super().__init__(
            capabilities=stt.STTCapabilities(
                streaming=False, interim_results=False
            )
        )
    
    async def recognize(
        self, buffer: AudioBuffer, *, language: str | None = None
    ) -> stt.SpeechEvent:
        
        # io_buffer = io.BytesIO()
        temp = tempfile.NamedTemporaryFile(delete=False, suffix='.wav')
        filename = temp.name
        with wave.open(temp, "wb") as wav:
            wav.setnchannels(buffer.num_channels)
            wav.setsampwidth(2)  # 16-bit
            wav.setframerate(buffer.sample_rate)
            wav.writeframes(buffer.data)

        temp.close()
        # data = io_buffer.getvalue()
        text = ""
        try:
            text = self.client.predict(handle_file(filename), "Mandarin Chinese", "English", api_name="/s2tt")
        except Exception as e:
            logger.exception(f"Exception {e} when calling m4t")

        return stt.SpeechEvent(
            type=stt.SpeechEventType.FINAL_TRANSCRIPT,
            alternatives=[
                stt.SpeechData(
                    language=language,
                    text=text,
                )
            ]
        )

def prewarm(proc: JobProcess):
    proc.userdata["vad"] = silero.VAD.load()

async def entrypoint(ctx: JobContext):
    logger.info("starting speech-to-text example")
    stt = M4tTranslate()
    vad=ctx.proc.userdata["vad"]
    stt = StreamAdapter(stt = stt, vad = vad)

    async def transcribe_track(participant: rtc.RemoteParticipant, track: rtc.Track):
        audio_stream = rtc.AudioStream(track)
        stt_forwarder = transcription.STTSegmentsForwarder(
            room=ctx.room, participant=participant, track=track
        )
        stt_stream = stt.stream()
        asyncio.create_task(_forward_transcription(stt_stream, stt_forwarder))

        async for ev in audio_stream:
            stt_stream.push_frame(ev.frame)

    await ctx.connect(auto_subscribe=AutoSubscribe.AUDIO_ONLY)

    @ctx.room.on("track_subscribed")
    def on_track_subscribed(
        track: rtc.Track,
        publication: rtc.TrackPublication,
        participant: rtc.RemoteParticipant,
    ):
        if track.kind == rtc.TrackKind.KIND_AUDIO:
            asyncio.create_task(transcribe_track(participant, track))

if __name__ == "__main__":
    cli.run_app(WorkerOptions(entrypoint_fnc=entrypoint, prewarm_fnc=prewarm))