
#! /bin/sh
mkdir -p /root/models

apt update·
apt install wget git  build-essential -y

cd /app
git clone https://github.com/facebookresearch/seamless_communication.git 
cd seamless_communication

pip install . -i https://pypi.tuna.tsinghua.edu.cn/simple/
cd demo/m4tv2
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/

wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/.gitattributes?download=true -q -O /root/models/.gitattributes
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/README.md?download=true -q  -O /root/models/README.md
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/added_tokens.json?download=true -q  -O /root/models/added_tokens.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/config.json?download=true -q  -O /root/models/config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/generation_config.json?download=true -q  -O /root/models/generation_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/m4t_v2_multitask_unity2.pt?download=true -q  -O /root/models/m4t_v2_multitask_unity2.pt
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model-00001-of-00002.safetensors?download=true -q  -O /root/models/model-00001-of-00002.safetensors
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model-00002-of-00002.safetensors?download=true -q  -O /root/models/model-00002-of-00002.safetensors
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/model.safetensors.index.json?download=true -q  -O /root/models/model.safetensors.index.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/preprocessor_config.json?download=true -q  -O /root/models/preprocessor_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/seamlessM4T_v2_large.pt?download=true -q  -O /root/models/seamlessM4T_v2_large.pt
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/seamlessm4t_arch.svg?download=true -q  -O /root/models/seamlessm4t_arch.svg
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/sentencepiece.bpe.model?download=true -q  -O /root/models/sentencepiece.bpe.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/special_tokens_map.json?download=true -q  -O /root/models/special_tokens_map.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/spm_char_lang38_tc.model?download=true -q  -O /root/models/spm_char_lang38_tc.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/tokenizer.model?download=true -q  -O /root/models/tokenizer.model
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/tokenizer_config.json?download=true -q  -O /root/models/tokenizer_config.json
wget https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/vocoder_v2.pt?download=true -q  -O /root/models/vocoder_v2.pt

# https://hf-mirror.com/facebook/seamless-m4t-v2-large/resolve/main/m4t_v2_multitask_unity2.pt?download=true
