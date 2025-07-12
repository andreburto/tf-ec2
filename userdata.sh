#!/bin/bash

apt-get update;

apt-get install -y python3 python3-venv python3-pip

# Create a virtual environment
python3 -m venv /home/ubuntu/venv

# Activate the virtual environment
source /home/ubuntu/venv/bin/activate

# Install the required Python packages
pip install --upgrade pip
pip install awscli boto3 requests
