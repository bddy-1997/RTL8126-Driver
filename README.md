### 螃蟹RTL8126 5G有线网卡
仅在PVE8.3版本下测试

```plain
apt update -y
apt-get -y install git
apt-get -y install dkms build-essential make gcc libelf-dev
reboot
uname -r
apt install proxmox-headers-$(uname -r)
git clone https://github.com/bddy-1997/RTL8126-Driver.git
cd RTL8126-Driver
tar vjxf $PWD/r8126-10.014.01.tar.bz2
cd r8126-10.014.01
chmod a+x autorun.sh
./autorun.sh
lsmod | grep r8126
```

