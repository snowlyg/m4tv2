
#! /bin/sh
mkdir -p /root/models

apt update
apt install wget git  build-essential -y

cd /app
git clone https://github.com/facebookresearch/seamless_communication.git --depth 1
cd seamless_communication
# cd /app/seamless_communication

pip install . -i https://pypi.tuna.tsinghua.edu.cn/simple/
cd demo/m4tv2
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/

# ./download-models.sh