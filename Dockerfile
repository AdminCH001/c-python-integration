# Base image
FROM ubuntu:20.04

# Disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && apt-get install -y \
    gcc \
    python3 \
    python3-pip

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Build the C program
RUN gcc -o main main.c

# Install Python dependencies (if any)
RUN pip3 install -r requirements.txt

# Run Python test
CMD ["python3", "test.py"]
