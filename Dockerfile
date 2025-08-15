# Set base image (host OS)
FROM python:3.11.8

# Set environment variables for Matplotlib and Fontconfig cache directories
ENV MPLCONFIGDIR=/app/matplotlib_cache
ENV FONTCONFIG_PATH=/app/fontconfig
ENV FONTCONFIG_PATH=/app/fontconfig

ENV HTTP_PROXY=""
ENV HTTPS_PROXY=""
ENV NO_PROXY="localhost,127.0.0.1"

# Create the necessary directories within your Docker image
RUN mkdir -p /nonexistent /app/src /app/src/models /app/matplotlib_cache /app/fontconfig  

# Copy your application's code
COPY ./requirements.txt /app/
COPY ./app.py /app/src/
COPY ./lang_list.py /app/src/
COPY ./download.sh /app/src/

# Set permissions for the created directories
RUN chmod +x /app/src/download.sh
RUN /app/src/download.sh
RUN chmod -R 777 /nonexistent /app 

# Install Python dependencies within your Docker image
RUN pip install -r /app/requirements.txt

# Set the working directory
WORKDIR /app/src

# Expose the port your app runs on
EXPOSE 8000

# Set the entry point command
CMD ["python", "app.py"]