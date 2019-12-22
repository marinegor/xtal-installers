#!/bin/bash

CCP4_YADISK="$1"
if ! [[ "${CCP4_YADISK}" ]]; then
	echo "Should provide yandex-disk link to CCP4 as first argument" 
	exit 0
fi

if ! [[ $(which yadisk-direct) ]]; then
	read -r  -n 1 -p "Install yadisk-direct via pip: " 'mainmenuinput' 
	if [[ "$mainmenuinput" == "y" ]]; then
		pip3 install --user yadisk-direct; fi
fi

read -r  -n 1 -p "Download CCP4:" 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	curl -L "$(yadisk-direct ${CCP4_YADISK})" -o "ccp4-7.0.078-shelx-arpwarp-linux64.tar"
else
	:
fi


read -r  -n 1 -p "Install CCP4 without ARP/wARP: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	tar -xvf "ccp4-7.0.078-shelx-arpwarp-linux64.tar"
	cd "ccp4-7.0" || return
	./BINARY.setup
	echo "## Added by install_ccp4.sh" >> ~/.bashrc
	echo "source $(pwd)/bin/ccp4.setup-sh" >> ~/.bashrc
else
	:
fi

