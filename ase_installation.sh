#!/bin/bash

# Function to check if Python 3.9 is installed
check_python39() {
    if command -v python3.9 > /dev/null 2>&1; then
        echo "Python 3.9 is already installed."
        return 0
    else
        echo "Python 3.9 is not installed. Installing Python 3.9 from source..."
        return 1
    fi
}

# Update package list and install prerequisites
echo "Updating packages..."
sudo apt update

# Check and install Python 3.9 if necessary
if ! check_python39; then
    # Install build dependencies
    sudo apt install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libgdbm-dev \
        libdb5.3-dev \
        libbz2-dev \
        libexpat1-dev \
        liblzma-dev \
        tk-dev \
        libffi-dev \
        wget

    # Download Python 3.9 source code
    cd /tmp
    wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
    tar -xf Python-3.9.0.tgz
    cd Python-3.9.0

    # Build and install Python 3.9
    ./configure --enable-optimizations
    make -j $(nproc)
    sudo make altinstall

    # Return to the original directory
    cd -
fi

# Define the virtual environment directory relative to the current directory
ASE_ENV_DIR=$(pwd)/ase_env

# Create the virtual environment with Python 3.9
echo "Creating ASE virtual environment in $ASE_ENV_DIR..."
python3.9 -m venv "$ASE_ENV_DIR"
source "$ASE_ENV_DIR/bin/activate"

# Upgrade pip in the virtual environment
echo "Upgrading pip..."
pip install --upgrade pip

# Install ASE and its dependencies
echo "Installing ASE and dependencies (NumPy, SciPy, Matplotlib)..."
pip install ase numpy scipy matplotlib

# Add ase_env/bin to PATH in .bashrc using the dynamically determined path
echo "Adding ASE to PATH in .bashrc with path: $ASE_ENV_DIR/bin"
echo "export PATH=\"$ASE_ENV_DIR/bin:\$PATH\"" >> ~/.bashrc

# Apply changes to PATH for the current session
source ~/.bashrc

# Verify installation
echo "Verifying ASE installation..."
if command -v ase > /dev/null 2>&1; then
    echo "ASE installed successfully. You can now run 'ase gui' or other ASE commands."
else
    echo "ASE installation failed. Please check for any errors."
fi

# End of script
echo "ASE setup complete!"

