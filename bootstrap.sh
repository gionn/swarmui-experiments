#!/bin/bash
# Bootstrap script to setup SwarmUI on a fresh Debian 12 server

set -e

# Install .NET SDK from Microsoft's repository if not already installed
if ! command -v dotnet &> /dev/null; then
  wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
fi

# Install required packages
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0 git python3-pip

# Install CUDA
sudo apt-get install -y nvidia-cuda-toolkit &
CUDA_PID=$!

# Clone SwarmUI repository if not already present
if [ ! -d ~/work ]; then
    git clone https://github.com/mcmonkeyprojects/SwarmUI.git ~/work
    cd ~/works
else
    cd ~/work
    git pull
fi

wait $CUDA_PID
./launch-linux.sh --launch_mode none
