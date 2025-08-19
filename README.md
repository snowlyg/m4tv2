# m4tv2

[Deployment of Seamless M4T v2 models on SAP AI Core](https://community.sap.com/t5/technology-blog-posts-by-sap/deployment-of-seamless-m4t-v2-models-on-sap-ai-core/ba-p/13680013)
[使用 WebRTC 构建实时 AI 助手](https://aws.amazon.com/cn/blogs/china/building-a-real-time-ai-assistant-with-webrtc/)
[seamless-m4t-v2-large](https://huggingface.co/spaces/facebook/seamless-m4t-v2-large/blob/main/Dockerfile)

## build docker

```bash
sudo docker buildx build --build-arg HTTPS_PROXY="http://192.168.20.19:57217" -t seamless_communication .
```

## run docker
```bash
sudo docker run --name seamless_communication -e CHECKPOINTS_PATH="/root/models" -e GRADIO_SERVER_NAME="0.0.0.0" -e HTTPS_PROXY="http://192.168.20.19:57217" -p 7860:7860 -d seamless_communication
sudo docker run --gpus all --name seamless_communication -e CHECKPOINTS_PATH="/root/models" -e GRADIO_SERVER_NAME="0.0.0.0" -p 7860:7860 -d seamless_communication
```

## open web
[http://localhost:7860](http://localhost:7860)

docker run --privileged -itd --name agent -v /Users/rodin/workplace/python/agent:/root/agent:rw --platform linux/amd64 ubuntu:20.04