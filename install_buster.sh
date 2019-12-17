#!/bin/bash

BUSTER_YADISK="$1"

if ! [[ "${BUSTER_YADISK}" ]]; then
	echo "Should provide yandex-disk link to BUSTER as first argument" 
	exit 0
fi


if [[ $(which yadisk-direct) ]]; then
	read -r  -n 1 -p "Install yadisk-direct via pip: " 'mainmenuinput' 
	if [[ "$mainmenuinput" == "y" ]]; then
		pip install --user yadisk-direct; fi
fi

read -r  -n 1 -p "Download BUSTER from yandex-disk: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	curl -L "$(yadisk-direct ${BUSTER_YADISK})" -o "GPhL_BUSTER_snapshot_20191129.linux64.tar"
	tar -xvf GPhL_BUSTER_snapshot_20191129.linux64.tar
else
	:
fi



read -r  -n 1 -p "Install BUSTER:" 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	mkdir -p BUSTER_snapshot_20191129
	cd BUSTER_snapshot_20191129 || return
	cmod +x GPhL_BUSTER_snapshot_20191129_install.sh
	mv install_buster.sh ..
	./GPhL_BUSTER_snapshot_20191129_install.sh
	echo "## Added by install_buster.sh" >> ~/.bashrc
	echo "$(pwd)/setup.sh" >> ~/.bashrc
else
	:
fi
