#!/bin/sh

#Update Kali to newest version
echo start update kali
cat /etc/apt/sources.list (optional)
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list
sudo apt update && sudo apt -y full-upgrade 	#Take a while
echokali update done



#Desktop install 
echo starting to install kali desktop 
sudo apt upgrade && sudo apt install kali-win-kex -y   #take a while
echo desktop is installed


#Start kali in dindow mode
win-kex --win -s

#Create Folder
echo creating folder
cd /home/catsec/
mkdir Tools
mkdir Envs
mkdir Hacks
mkdir Wordlist

echo installing tools
sudo bash
apt-get install aircrack-ng wireshark tshark nmap sqlmap john git steghide gobuster dirbuster exif vim bleachbit default-jdk ssh smbclient netcat hydra ftp  libimage-exiftool-perl perl-doc  binutils -y


cd /home/catsec/Downloads 

#Metasploit
echo installing metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall



#Bettercap
echo installing bettercap with libs
sudo apt-get install libpcap-dev
sudo apt-get install libusb-1.0-0
sudo apt-get install libnetfilter-queue-dev


https://github.com/bettercap/bettercap/releases/download/v2.28/bettercap_linux_amd64_v2.28.zip
unzip bettercap_linux_amd64_v2.28.zip 
cp bettercap /usr/bin/


#Miniconda
echo installing miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod 777 Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh 
rm ./Miniconda3-latest-Linux-x86_64.sh 
export PATH="/home/catsec/miniconda3/bin:$PATH"		


#Zaproxy.
echo installing ZAP
wget https://github.com/zaproxy/zaproxy/releases/download/v2.9.0/ZAP_2.9.0_Linux.tar.gz
tar -xzf ZAP_2.9.0_Linux.tar.gz
cp -r ZAP_2.9.0 /home/catsec/Tools/


cd /home/catsec/Tools/

#LinPeas
echo installing LinPeas
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
mv privilege-escalation-awesome-scripts-suite/ LinPEAS

#LinEnum
echo installing LinEnum
git clone https://github.com/rebootuser/LinEnum.git

#Hunt Extension
echo installing HUNT
git clone https://github.com/bugcrowd/HUNT.git


#Stegcracker
echo installing Steagcracker
git clone https://github.com/Paradoxis/StegCracker.git

#Radare2
git clone git clone https://github.com/radareorg/radare2
cd radare2 ; sys/install.sh
cd ..

#The Harvester
echo installing the harvester
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
python3 -m pip install -r requirements/dev.txt



echo cleaning downloads
cd /home/catsec/Downloads
sudo rm -r *


