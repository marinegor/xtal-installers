#!/bin/bash

read -r  -n 1 -p "Download and install XDS:" 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	mkdir xds
	cd xds || exit
	sudo cd /usr/local/bin
	sudo wget -O- ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz | tar xzvf -
	sudo ln -sf XDS-INTEL64_Linux_x86_64/* .
	echo "export PATH=\"\$PATH:${PWD}/XDS-INTEL64_Linux_x86_64\"" >> ~/.bashrc
else
	:
fi
