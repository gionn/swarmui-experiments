
# SwarmUI Experiments Bootstrap

This repository provides a bootstrap script to quickly set up [SwarmUI](https://github.com/mcmonkeyprojects/SwarmUI) on a fresh Debian 12 server. SwarmUI is a powerful interface for managing distributed AI workloads.

## Quick Start

Run the following command to bootstrap your environment:

```sh
curl https://raw.githubusercontent.com/gionn/swarmui-experiments/refs/heads/master/bootstrap.sh | bash
```

## What the Script Does
1. Installs the .NET SDK 8.0 if not present
2. Installs Git and Python3-pip
3. Installs NVIDIA CUDA Toolkit
4. Clones the SwarmUI repository to `~/work` and updates it if already present
5. Launches SwarmUI with default settings

## Troubleshooting

- If you encounter issues with CUDA, verify your GPU is supported and drivers are installed
- For .NET SDK issues, see [Microsoft's documentation](https://learn.microsoft.com/en-us/dotnet/core/install/linux)

## Resources

- [SwarmUI Project](https://github.com/mcmonkeyprojects/SwarmUI)
- [Debian Documentation](https://www.debian.org/doc/)

---
Feel free to open issues or contribute improvements!
