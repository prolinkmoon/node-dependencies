#!/bin/bash

set -e

echo "🔧 VPS Initial Setup Script for Ubuntu"

# Basic updates
echo "🔄 Updating packages..."
sudo apt update && sudo apt upgrade -y

# Common tools
echo "📦 Installing common utilities..."
sudo apt install -y curl wget git unzip zip ufw htop net-tools build-essential software-properties-common

# Firewall setup
echo "🛡️ Enabling UFW and allowing SSH..."
sudo ufw allow OpenSSH
sudo ufw --force enable

# Show IP address
echo "🌐 Your server IP addresses:"
ip a | grep inet


# Optional installs
echo ""
read -p "➡️  Install Docker? (y/n): " install_docker
if [[ "$install_docker" == "y" ]]; then
    echo "🐳 Installing Docker..."
    curl -fsSL https://get.docker.com | bash
    sudo usermod -aG docker $USER
fi

read -p "➡️  Install Node.js (LTS)? (y/n): " install_node
if [[ "$install_node" == "y" ]]; then
    echo "🟢 Installing Node.js LTS..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
    node -v && npm -v
fi

read -p "➡️  Install Rust? (y/n): " install_rust
if [[ "$install_rust" == "y" ]]; then
    echo "🦀 Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    rustc --version
fi

echo ""
echo "✅ Common Dependencies setup complete! You may need to reboot for group changes to take effect."
