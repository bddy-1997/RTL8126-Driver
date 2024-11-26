#!/bin/bash

dir="/etc/apt/sources.list.d/"
file="/etc/apt/sources.list"
backup_dir="/backup/sources_list_backup/"

# Function to check if directory exists and delete it
delete_directory() {
  if [ -d "$1" ]; then
    echo "Deleting directory $1..."
    mv "$1" "$backup_dir"  # Backup the directory before deletion
    echo "Directory deleted."
  else
    echo "Directory $1 does not exist. Skipping deletion."
  fi
}

# Function to replace content of a file
replace_file_content() {
  echo "Replacing content of $1..."
  cat > "$1" <<EOL
deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian-security bookworm-security main
deb https://mirrors.ustc.edu.cn/proxmox/debian bookworm pve-no-subscription
EOL
  echo "Content replaced."
}

# Main script
delete_directory "$dir"
replace_file_content "$file"
