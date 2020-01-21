#!/bin/bash

BUSTER_YADISK="$1"

if ! [[ "${BUSTER_YADISK}" ]]; then
	echo "Should provide yandex-disk link to BUSTER as first argument" 
	exit 0
fi

if ! [[ $(which pip3) ]]; then
	read -r  -n 1 -p "Install python-pip3:" 'mainmenuinput' 
	if [[ "$mainmenuinput" == "y" ]]; then
		sudo apt-get install python-pip3; fi
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


read -r  -n 1 -p "Download BUSTER from yandex-disk: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	curl -L "$(yadisk-direct "$BUSTER_YADISK")" -o "GPhL_BUSTER_snapshot_20191129.linux64.tar"
	tar -xvf GPhL_BUSTER_snapshot_20191129.linux64.tar
	mv buster_install BUSTER_snapshot_20191129
else
	:
fi


read -r  -n 1 -p "Install BUSTER:" 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	cd BUSTER_snapshot_20191129 || return
	cmod +x GPhL_BUSTER_snapshot_20191129_install.sh
	./GPhL_BUSTER_snapshot_20191129_install.sh
	echo "## Added by install_buster.sh" >> ~/.bashrc
	echo ". $(pwd)/setup.sh" >> ~/.bashrc
else
	:
fi
