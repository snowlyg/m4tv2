# Set base image (host OS)
FROM python:3.11.8

# Set environment variables for Matplotlib and Fontconfig cache directories
ENV MPLCONFIGDIR=/app/matplotlib_cache
ENV FONTCONFIG_PATH=/app/fontconfig
ENV CHECKPOINTS_PATH=/root/models

ENV HTTP_PROXY=""
ENV HTTPS_PROXY=""
ENV NO_PROXY="localhost,127.0.0.1"

# Create the necessary directories within your Docker image
RUN mkdir -p /app /root/models /app/matplotlib_cache /app/fontconfig  

# Copy your application's code
COPY ./download.sh /root

# Set permissions for the created directories
RUN chmod +x /root/download.sh  
RUN /root/download.sh

RUN chmod -R 777  /app /root/models

# Install Python dependencies within your Docker image
# RUN pip install -r /app/requirements.txt

# Set the working directory
WORKDIR /app/seamless_communication/demo/m4tv2

# Expose the port your app runs on
EXPOSE 7860

# Set the entry point command
CMD ["python", "app.py"]