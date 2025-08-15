
#! /bin/sh
# git clone https://github.com/facebookresearch/seamless_communication.git /app/src

# cat > /app/src/demo/m4tv2/requirements.txt << 'EOF'
# git+https://github.com/facebookresearch/seamless_communication.git
# fairseq2==0.2.0
# gradio==4.21.0
# httpx==0.27.0
# omegaconf==2.3.0
# pydub==0.25.1
# sentencepiece==0.2.0
# EOF

apt install wget git

wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/.gitattributes?download=true -O /app/src/models/.gitattributes
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/README.md?download=true -O /app/src/models/README.md
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/added_tokens.json?download=true -O /app/src/models/added_tokens.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/config.json?download=true -O /app/src/models/config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/generation_config.json?download=true -O /app/src/models/generation_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/m4t_v2_multitask_unity2.pt?download=true -O /app/src/models/m4t_v2_multitask_unity2.pt
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model-00001-of-00002.safetensors?download=true -O /app/src/models/model-00001-of-00002.safetensors
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model-00002-of-00002.safetensors?download=true -O /app/src/models/model-00002-of-00002.safetensors
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model.safetensors.index.json?download=true -O /app/src/models/model.safetensors.index.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/preprocessor_config.json?download=true -O /app/src/models/preprocessor_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/seamlessM4T_v2_large.pt?download=true -O /app/src/models/seamlessM4T_v2_large.pt
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/seamlessm4t_arch.svg?download=true -O /app/src/models/seamlessm4t_arch.svg
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/sentencepiece.bpe.model?download=true -O /app/src/models/sentencepiece.bpe.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/special_tokens_map.json?download=true -O /app/src/models/special_tokens_map.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/spm_char_lang38_tc.model?download=true -O /app/src/models/spm_char_lang38_tc.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/tokenizer.model?download=true -O /app/src/models/tokenizer.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/tokenizer_config.json?download=true -O /app/src/models/tokenizer_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/vocoder_v2.pt?download=true -O /app/src/models/vocoder_v2.pt

# https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/m4t_v2_multitask_unity2.pt?download=true
