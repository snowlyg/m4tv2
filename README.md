# m4tv2

[Deployment of Seamless M4T v2 models on SAP AI Core](https://community.sap.com/t5/technology-blog-posts-by-sap/deployment-of-seamless-m4t-v2-models-on-sap-ai-core/ba-p/13680013)
[使用 WebRTC 构建实时 AI 助手](https://aws.amazon.com/cn/blogs/china/building-a-real-time-ai-assistant-with-webrtc/)

## build docker

```bash
sudo docker buildx build --build-arg HTTPS_PROXY="http://127.0.0.1:57217" -t snowlyg/seamless_communication .
```

## run docker
```bash
sudo docker run --user nobody -p 8000:8000 -d snowlyg/seamless_communication
```