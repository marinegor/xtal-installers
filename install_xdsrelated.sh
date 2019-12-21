#!/bin/bash

read -r  -n 1 -p "Install all necessary core utils (bc, gawk, sed, ...) " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	sudo apt install libqt4-opengl
	sudo apt-get install xxdiff
	sudo apt-get install coreutils binutils gawk sed bc grep
else
	:
fi


read -r  -n 1 -p "Install XDS-related packages (xdscc12, xdsstat, etc): " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	# wget ftp://turn5.biologie.uni-konstanz.de/pub/linux_bin/get_folder.sh
	wget ftp://strucbio.biologie.uni-konstanz.de/pub/linux_bin/get_folder.sh
	chmod +x get_folder.sh
	mkdir xdsrelated; cd xdsrelated || return
	mv ../get_folder.sh .
	bash get_folder.sh
	echo "# Added by install_xdsrelated.sh" >> ~/.bashrc
	echo "export PATH=\"\$PATH:${PWD}\"" >> ~/.bashrc
else
	:
fi

