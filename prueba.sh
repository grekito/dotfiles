#!/bin/bash

# Check if dialog is installed, if not, install it
if ! command -v dialog &> /dev/null; then
    echo "dialog is not installed. Installing..."
    # Install dialog or any other dependencies here
fi

# Update system or perform any other necessary setup steps here
sudo pacman -Syu

# Function to display message and wait for key press
pause() {
    dialog --title "Press Enter to continue" --msgbox "\n\n$1" 10 60
}


install_packages() {
    # Placeholder for installing packages
    pause "Packages installed"
}

clone_dotfiles() {
    # Placeholder for cloning dotfiles from GitHub
    pause "Dotfiles cloned from GitHub"
}

# Main menu
while true; do
    choice=$(dialog --stdout --title "Arch Linux Post-Installation Setup" --menu "Choose an option:" 15 60 8 \
        1 "Install Packages" \
        2 "Clone Dotfiles from GitHub" \
        0 "Exit")

    case $choice in
        1) install_packages;;
        2) clone_dotfiles;;
        0) exit;;
        *) pause "Invalid choice";;
    esac
done

