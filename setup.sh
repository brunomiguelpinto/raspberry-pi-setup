#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Define update and cleanup functions
update_system() {
    echo "Updating system packages..."
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    echo "System update and cleanup complete."
}

# Check if Vim is installed and install if not
check_vim() {
    if [ -x "$(command -v vim)" ]; then
        echo "Vim is already installed."
    else
        echo "Installing Vim..."
        sudo apt-get install -y vim
    fi
}

# Function to check if Docker is installed
check_docker() {
    if [ -x "$(command -v docker)" ]; then
        echo "Docker is already installed."
    else
        echo "Installing Docker..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        # Add your user to the Docker group
        sudo usermod -aG docker ${USER}
        echo "Docker installed. Please log out and log back in to apply Docker group changes."
        echo "After logging back in, re-run this script to complete the setup."
        exit 1  # Exit script to allow user to log out and back in
    fi
}

# Begin script execution
update_system         # Update and clean the system first
check_vim             # Install Vim if not installed
check_docker          # Install Docker if not installed