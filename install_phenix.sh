#!/bin/bash

PHENIX_YADISK="$1"

if ! [[ "${PHENIX_YADISK}" ]]; then
	echo "Should provide yandex-disk link to PHENIX as first argument" 
	exit 0
fi


if ! [[ $(which yadisk-direct) ]]; then
	read -r  -n 1 -p "Install yadisk-direct via pip: " 'mainmenuinput' 
	if [[ "$mainmenuinput" == "y" ]]; then
		sudo apt-get install python3-pip
		pip3 install --user wldhx.yadisk-direct; fi
fi

if ! [[ $(which curl) ]]; then
	read -r  -n 1 -p "Install curl: " 'mainmenuinput' 
	if [[ "$mainmenuinput" == "y" ]]; then
		sudo apt-get install curl; fi
fi


read -r  -n 1 -p "Download PHENIX from yandex-disk: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	curl -L "$(yadisk-direct ${PHENIX_YADISK})" -o "phenix_installer.tar.gz"
else
	:
fi



read -r  -n 1 -p "Unpack phenix:" 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	gzip -d phenix_installer.tar.gz
	tar -xvf phenix_installer.tar
	mv "phenix-installer-1.17.1-3660-intel-linux-2.6-x86_64-centos6" phenix
else
	:
fi

read -r  -n 1 -p "Install phenix:" 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	cd phenix || return
	sudo ./install
	echo "## Added by install_phenix.sh" >> ~/.bashrc
	echo "source /usr/local/phenix-1.17.1-3660/phenix_env" >> ~/.bashrc
else
	:
fi
