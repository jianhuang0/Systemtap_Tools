#stapxx 工具包
wget https://github.com/openresty/stapxx/archive/master.zip -O stapxx.zip
unzip stapxx.zip

#flameGraph
wget https://github.com/brendangregg/FlameGraph/archive/master.zip -O flameGraph.zip
uzip flameGraph.zip

#gdb-utils
wget https://github.com/openresty/openresty-gdb-utils/archive/master.zip -O gdb-utils.zip
unzip gdb-utils.zip

#install systemtap
sudo apt-get install -y systemtap gcc

# install debug symbols
# for ubuntu 16.04 and higher
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C8CAB6595FDFF622

codename=$(lsb_release -c | awk  '{print $2}')
sudo tee /etc/apt/sources.list.d/ddebs.list << EOF
deb http://ddebs.ubuntu.com/ ${codename}      main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-security main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-updates  main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-proposed main restricted universe multiverse
EOF

sudo apt-get update
sudo apt-get install linux-image-$(uname -r)-dbgsym
