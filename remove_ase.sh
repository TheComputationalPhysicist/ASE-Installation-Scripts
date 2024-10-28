#!/bin/bash

# Fetch ASE environment path from .bashrc or set it to default
ASE_ENV_DIR=$(grep 'ASE_ENV_DIR=' ~/.bashrc | cut -d'=' -f2)
ASE_ENV_DIR="${ASE_ENV_DIR:-$(pwd)/ase_env}"  # Default to current dir if not found

# Check if the ASE environment directory exists and remove it
if [ -d "$ASE_ENV_DIR" ]; then
    echo "Removing ASE environment directory at $ASE_ENV_DIR..."
    rm -rf "$ASE_ENV_DIR"
else
    echo "ASE environment directory not found at $ASE_ENV_DIR."
fi

# Remove the PATH entry for ASE from .bashrc
echo "Removing ASE PATH entry from .bashrc..."
sed -i '/ASE_ENV_DIR/d' ~/.bashrc

# Apply changes to PATH
source ~/.bashrc

# Check if Python 3.9 was installed from source
if command -v python3.9 > /dev/null 2>&1; then
    read -p "Do you want to remove Python 3.9 installed from source? (y/n): " confirm
    if [ "$confirm" == "y" ]; then
        echo "Removing Python 3.9..."
        sudo rm -rf /usr/local/bin/python3.9 /usr/local/bin/python3.9-config \
                    /usr/local/lib/python3.9 /usr/local/include/python3.9 \
                    /usr/local/share/man/man1/python3.9.1
    else
        echo "Python 3.9 was not removed."
    fi
else
    echo "Python 3.9 not found or was not installed from source."
fi

echo "ASE environment and Python 3.9 removal complete."

