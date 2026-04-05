#!/bin/bash

# Install base dependencies from requirements.txt
while read package; do
    # Skip empty lines and comments
    [[ -z "$package" || "$package" =~ ^# ]] && continue
    # Skip PyTorch lines - install separately with correct index
    [[ "$package" =~ ^(torch|torchvision|torchaudio) ]] && continue
    pip install "$package"
done < requirements.txt

# Install ROCm PyTorch
echo "Installing ROCm PyTorch..."
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm7.2
