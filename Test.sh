#!/bin/bash

# 定义日志文件路径
log_file="/var/log/source_update.log"

# 记录脚本开始运行的时间
echo "Script started at $(date)" >> "$log_file"

# 自动识别系统是 Ubuntu 还是 Debian
if [ -f /etc/os-release ]; then
 . /etc/os-release
  if [ "$ID" = "ubuntu" ]; then
    echo "Detected Ubuntu system."
    distro="ubuntu"
  elif [ "$ID" = "debian" ]; then
    echo "Detected Debian system."
    distro="debian"
  else
    echo "Unsupported distribution. Exiting."
    exit 1
  fi
else
  echo "Could not detect the distribution. Exiting."
  exit 1
fi

# 定义要操作的目录和文件
dir="/etc/apt/sources.list.d/"
file="/etc/apt/sources.list"

# 删除目录，如果存在的话
if [ -d "$dir" ]; then
  echo "Deleting directory $dir..."
  rm -rf "$dir"
  echo "Directory deleted." >> "$log_file"
else
  echo "Directory $dir does not exist. Skipping deletion." >> "$log_file"
fi

# 替换文件内容
echo "Replacing content of $file..."
if [ "$distro" = "ubuntu" ]; then
  echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse" > "$file"
  echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse" >> "$file"
  echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse" >> "$file"
  echo "deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse" >> "$file"
elif [ "$distro" = "debian" ]; then
  echo "deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free" > "$file"
  echo "deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free" >> "$file"
  echo "deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free" >> "$file"
  echo "deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free" >> "$file"
fi

# 记录替换操作完成的时间
echo "Content replaced at $(date)" >> "$log_file"

echo "Content replaced."
