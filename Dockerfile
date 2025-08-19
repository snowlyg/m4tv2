
FROM seamless_communication

ENV CHECKPOINTS_PATH=/root/models
ENV CHECKPOINTS_PATH=/root/models

# Set the working directory
WORKDIR /root/seamless_communication/demo/m4tv2

# Expose the port your app runs on
EXPOSE 7860

# Set the entry point command
CMD ["python", "app.py"]