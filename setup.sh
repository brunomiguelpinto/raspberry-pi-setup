#!/bin/bash

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

# Begin script execution
update_system         # Update and clean the system first
check_vim             # Install Vim if not installed
