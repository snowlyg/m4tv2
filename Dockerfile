
FROM m4tv2

# Set the working directory
WORKDIR /home/seamless_communication/demo/m4tv2

# Expose the port your app runs on
EXPOSE 7860

# Set the entry point command
CMD ["python", "app.py"]