#!/bin/bash

# Startup prompt with stylized header
set_color() {
    if [ "$1" = "magenta" ]; then echo -ne "\e[35m"; fi
    if [ "$1" = "normal" ]; then echo -ne "\e[0m"; fi
}

log() {
    echo -e "\e[32m[+]\e[0m $1"
}

error() {
    echo -e "\e[31m[-]\e[0m $1"
}

set_color magenta
echo '  ▄█       ███    █▄   ▄████████    ▄█   ▄█▄ ▄██   ▄   ' 
echo ' ███       ███    ███ ███    ███   ███ ▄███▀ ███   ██▄ ' 
echo ' ███       ███    ███ ███    █▀    ███▐██▀   ███▄▄▄███ ' 
echo ' ███       ███    ███ ███         ▄█████▀    ▀▀▀▀▀▀███ ' 
echo ' ███       ███    ███ ███        ▀▀█████▄    ▄██   ███ ' 
echo ' ███       ███    ███ ███    █▄    ███▐██▄   ███   ███ ' 
echo ' ███▌    ▄ ███    ███ ███    ███   ███ ▀███▄ ███   ███ ' 
echo ' █████▄▄██ ████████▀  ████████▀    ███   ▀█▀  ▀█████▀  ' 
set_color normal

log 'Welcome to the lucky themes installer!'
log 'Before continuing, please select the themes you want to install. \n'

# Theme Definition Array
THEMES=("Dasli" "BlackArch" "MonoDark" "Reze")
TARGET_BASE="/usr/lib/python3.14/site-packages/caelestia/data/schemes"

# Menu Selection Function
choose_themes() {
    echo "Available themes to install:"
    echo "----------------------------"
    echo "0) All Themes"
    for i in "${!THEMES[@]}"; do
        echo "$((i+1))) ${THEMES[$i]}"
    done
    echo "----------------------------"
    
    read -p "Enter the number(s) of your choice split by spaces (e.g., 1 3): " -a choices
}

install_theme() {
    local theme_name=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    local display_name="$1"
    
    # Check if local directory component exists
    if [ ! -d "$theme_name" ]; then
        error "Source directory '$theme_name/' not found. Skipping $display_name."
        return
    fi

    log "Installing $display_name theme..."
    
    # Constructing correct Python system architecture paths
    sudo mkdir -p "$TARGET_BASE/$theme_name/lucky/"
    
    if [ -f "$theme_name/dark.txt" ]; then
        sudo cp "$theme_name/dark.txt" "$TARGET_BASE/$theme_name/lucky/dark.txt"
        log "$display_name successfully registered natively!"
    else
        error "Could not find $theme_name/dark.txt"
    fi
}

# Core Logic Loop
choose_themes

if [ ${#choices[@]} -eq 0 ]; then
    error "No selection made. Exiting."
    exit 1
fi

# Request sudo upfront so it doesn't interrupt the loop
log "Requesting administrative privileges for system installation..."
sudo -v

for choice in "${choices[@]}"; do
    if [ "$choice" -eq 0 ]; then
        log "Installing all themes..."
        for theme in "${THEMES[@]}"; do
            install_theme "$theme"
        done
        break
    elif [ "$choice" -gt 0 ] && [ "$choice" -le "${#THEMES[@]}" ]; then
        index=$((choice-1))
        install_theme "${THEMES[$index]}"
    else
        error "Invalid selection: $choice"
    fi
done

echo ""
log "Installation process complete!"
log "Remember to reload your environment instantly using 'Ctrl + Super + Alt + R' after selecting your new theme!"
