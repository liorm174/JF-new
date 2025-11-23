# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy application files
COPY main.py .
COPY hello.txt .

# Run the application
CMD ["python", "main.py"]

