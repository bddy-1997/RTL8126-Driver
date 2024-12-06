#!/bin/bash

dir="/etc/apt/sources.list.d/"
file="/etc/apt/sources.list"

if [ -d "$dir" ]; then
  echo "Deleting directory $dir..."
  sudo rm -rf "$dir"
  echo "Directory deleted."
else
  echo "Directory $dir does not exist. Skipping deletion."
fi

echo "Replacing content of $file..."

echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse" > "$file"
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse" >> "$file"
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse" >> "$file"
echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse" >> "$file"

echo "Content replaced."
