# append this to advanced user data options #
!#/bin/bash
yum update -y
yum install glibc.i686 libstdc++.i686 -y
useradd -m steam
su - steam
mkdir ~/Steam && cd ~/Steam
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
./steamcmd.sh +login anonymous +force_install_dir ./avorion/ +app_update 565060 validate +exit
cd avorion
mkdir galaxies

# run manually after instance is initialized #
#create galaxy #
./server.sh --galaxy-name noobgalaxy --admin {{ admin# }} --datapath ./galaxies
/save
/stop
# start server #
./server.sh --galaxy-name noobgalaxy --admin {{ admin# }} --datapath ./galaxies/

# Ports #
27000 - UDP & TCP
27003 - UDP
27020 - UDP
27021 - UDP
