# Base image
FROM ubuntu:20.04

# Disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && apt-get install -y \
    gcc \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-dev

# Set working directory
WORKDIR /app

# Copy all files from the local directory to the container
COPY . /app

# Build the C program
RUN gcc -o main main.c

# Install Python dependencies (if any)
RUN pip3 install -r requirements.txt

# Set executable permissions for the compiled C program
RUN chmod +x main

RUN ls -la /app

# Run the Python test script
CMD ["python3", "test.py"]
