#!/bin/bash

set -e

echo "🦀 Installing Rust using rustup (official installer)..."

# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "❌ curl not found. Installing curl..."
    sudo apt update && sudo apt install -y curl
fi

# Download and install rustup (official Rust installer)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source environment to activate Rust
source "$HOME/.cargo/env"

# Verify installation
echo ""
echo "✅ Rust version installed:"
rustc --version

echo "✅ Cargo (Rust package manager) version:"
cargo --version

echo ""
echo "📦 To update Rust in the future, just run:"
echo "    rustup update"

echo "🚀 Rust installation complete!"
