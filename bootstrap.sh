#!/bin/bash
# Bootstrap script to setup SwarmUI on a fresh Debian 12 server

set -e

WORKING_DIR=~/work

# Enable non-free repositories if not already enabled
if ! grep -q "contrib non-free" /etc/apt/sources.list.d/debian.sources; then
  sudo sed -i 's/Components: main/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources
fi

# Install .NET SDK from Microsoft's repository if not already installed
if ! command -v dotnet &> /dev/null; then
  wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
fi

# Install required packages
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0 git python3-pip python3-venv

# Install CUDA
sudo apt-get install -y nvidia-cuda-toolkit nvidia-driver firmware-misc-nonfree linux-headers-cloud-amd64 &
CUDA_PID=$!

# Clone SwarmUI repository if not already present
if [ ! -d $WORKING_DIR ]; then
    git clone https://github.com/mcmonkeyprojects/SwarmUI.git $WORKING_DIR
    cd $WORKING_DIR
else
    cd $WORKING_DIR
    git pull
fi

wait $CUDA_PID
./launch-linux.sh --launch_mode none
