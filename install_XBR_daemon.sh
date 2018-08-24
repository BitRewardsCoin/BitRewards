#!/bin/bash
# Install XBR daemon script
sudo apt-get update -qq -y
sudo apt-get upgrade -y -qq
sudo apt-get install -y pkg-config build-essential libssl-dev libcurl4-openssl-dev libdb++-dev libboost-all-dev libcrypto++-dev libqrencode-dev libminiupnpc-dev libgmp-dev libgmp3-dev autoconf autogen automake libtool git -qq -y
sudo apt-get install libdb5.3++ -qq -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get -y install ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
sudo ufw enable
sudo ufw status
sudo ufw allow 13871/tcp
sudo ufw allow 13872/tcp
sudo ufw allow 13873/tcp
sudo ufw allow 13874/tcp
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=2048k count=1000
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd 
sudo mkdir XBR
cd XBR
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
sudo mkdir .xbitrewards01
sudo setfacl -m u:xbradmin:rwx /home/xbradmin/XBR/.xbitrewards01
sudo echo "listen=1" > /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "rpcport=21001" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "daemon=1" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "rpcuser=username01" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "rpcpassword=password01" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "masternode=1" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "masternodeprivkey=ReplaceThisWithYourOwnMN1PrivKeyfromStep3k" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "masternodeaddr="$PUBLIC_IP":13871" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "staking=0" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "externalip="$PUBLIC_IP >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo echo "port=13871" >> /home/xbradmin/XBR/.xbitrewards01/bitrewards.conf
sudo mkdir .xbitrewards02
sudo setfacl -m u:xbradmin:rwx /home/xbradmin/XBR/.xbitrewards02
sudo echo "listen=1" > /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "rpcport=21002" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "daemon=1" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "rpcuser=username02" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "rpcpassword=password02" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "masternode=1" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "masternodeprivkey=ReplaceThisWithYourOwnMN2PrivKeyfromStep3k" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "masternodeaddr="$PUBLIC_IP":13872" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "staking=0" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "externalip="$PUBLIC_IP >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo echo "port=13872" >> /home/xbradmin/XBR/.xbitrewards02/bitrewards.conf
sudo mkdir .xbitrewards03
sudo setfacl -m u:xbradmin:rwx /home/xbradmin/XBR/.xbitrewards03
sudo echo "listen=1" > /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "rpcport=21003" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "daemon=1" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "rpcuser=username03" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "rpcpassword=password03" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "masternode=1" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "masternodeprivkey=ReplaceThisWithYourOwnMN3PrivKeyfromStep3k" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "masternodeaddr="$PUBLIC_IP":13873" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "staking=0" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "externalip="$PUBLIC_IP >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo echo "port=13873" >> /home/xbradmin/XBR/.xbitrewards03/bitrewards.conf
sudo mkdir .xbitrewards04
sudo setfacl -m u:xbradmin:rwx /home/xbradmin/XBR/.xbitrewards04
sudo echo "listen=1" > /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "rpcport=21004" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "daemon=1" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "rpcuser=username04" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "rpcpassword=password04" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "masternode=1" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "masternodeprivkey=ReplaceThisWithYourOwnMN4PrivKeyfromStep3k" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "masternodeaddr="$PUBLIC_IP":13874" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "staking=0" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "externalip="$PUBLIC_IP >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo echo "port=13874" >> /home/xbradmin/XBR/.xbitrewards04/bitrewards.conf
sudo git clone https://github.com/BitRewardsCoin/BitRewards.git
cd /home/xbradmin/XBR/BitRewards/src/secp256k1
sudo chmod +x autogen.sh
sudo ./autogen.sh
sudo ./configure 
sudo make
sudo make install
cd /home/xbradmin/XBR/BitRewards/src
sudo make -f makefile.unix
sudo strip bitrewardsd
sudo cp bitrewardsd ../../../bitrewardsd
sudo ldconfig –v
sudo ldconfig
cd
sudo touch .bash_aliases
sudo setfacl -m u:xbradmin:rwx /home/xbradmin/.bash_aliases
sudo echo "alias getinfo_mn01=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards01 -config=/home/xbradmin/XBR/.xbitrewards01/bitrewards.conf getinfo\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias getinfo_mn02=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards02 -config=/home/xbradmin/XBR/.xbitrewards02/bitrewards.conf getinfo\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias getinfo_mn03=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards03 -config=/home/xbradmin/XBR/.xbitrewards03/bitrewards.conf getinfo\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias getinfo_mn04=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards04 -config=/home/xbradmin/XBR/.xbitrewards04/bitrewards.conf getinfo\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias start_mn01=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards01 -config=/home/xbradmin/XBR/.xbitrewards01/bitrewards.conf -daemon\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias start_mn02=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards02 -config=/home/xbradmin/XBR/.xbitrewards02/bitrewards.conf -daemon\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias start_mn03=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards03 -config=/home/xbradmin/XBR/.xbitrewards03/bitrewards.conf -daemon\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias start_mn04=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards04 -config=/home/xbradmin/XBR/.xbitrewards04/bitrewards.conf -daemon\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias stop_mn01=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards01 -config=/home/xbradmin/XBR/.xbitrewards01/bitrewards.conf stop\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias stop_mn02=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards02 -config=/home/xbradmin/XBR/.xbitrewards02/bitrewards.conf stop\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias stop_mn03=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards03 -config=/home/xbradmin/XBR/.xbitrewards03/bitrewards.conf stop\"" >> /home/xbradmin/.bash_aliases
sudo echo "alias stop_mn04=\"sudo ./bitrewardsd -datadir=/home/xbradmin/XBR/.xbitrewards04 -config=/home/xbradmin/XBR/.xbitrewards04/bitrewards.conf stop\"" >> /home/xbradmin/.bash_aliases
source .bashrc
sudo echo "==========================================="
sudo echo "*** install_XBR_daemon.sh completed ;-) ***"
sudo echo "==========================================="