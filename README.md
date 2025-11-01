
# SwarmUI Experiments Bootstrap

This repository provides a bootstrap script to quickly set up [SwarmUI](https://github.com/mcmonkeyprojects/SwarmUI) on a fresh Debian 12 server. SwarmUI is a powerful interface for managing distributed AI workloads.

## Quick Start

Run the following command to bootstrap your environment:

```sh
curl https://raw.githubusercontent.com/gionn/swarmui-experiments/refs/heads/master/bootstrap.sh | bash
```

## What the Script Does

- Installs the .NET SDK 8.0 if not present
- Installs Git and Python requirements
- Installs NVIDIA CUDA Toolkit
- Clones the SwarmUI repository to `~/work` and updates it if already present
- Launches SwarmUI with default settings

## Google Cloud

Create a Google Cloud Compute Engine instance with an NVIDIA T4 GPU:

- Create Instance
- Region: us-central1 (or any other us based region for cheapest pricing)
- Select GPUs, Nvidia T4, 1 GPU (16GB memory)
- Machine type n1-standard-2 (8GB memory are recommended)
- OS Debian 12

To configure your ssh key for remote access, go to Settings > Metadata > SSH
Keys.

When connecting make sure to enable port-forwarding:

```sh
ssh -L 7801:localhost:7801 your-username@your-instance-ip
```

## Resources

- [SwarmUI Project](https://github.com/mcmonkeyprojects/SwarmUI)
- [Debian Documentation](https://www.debian.org/doc/)

---
Feel free to open issues or contribute improvements!
