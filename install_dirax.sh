#!/bin/bash

read -r  -n 1 -p "Download and install Dirax: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	wget http://www.crystal.chem.uu.nl/distr/dirax/download/dirax1.17-Linux-x86_64.tar.Z
	mkdir dirax
	mv dirax1.7-Linux.x86_64.tar.Z dirax/
	cd dirax || return
	uncompress dirax1.7-Linux.x86_64.tar.Z
	tar -xvf dirax1.7-Linux.x86_64.tar
else
	:
fi

read -r  -n 1 -p "Install libgfortran " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	sudo apt-get install libgfortran3
else
	:
fi

read -r  -n 1 -p "Add dirax indexer to your /usr/local/src: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
echo """
#!/bin/sh
 exec ${PWD}/dirax \"\$\@\"
""" | sudo tee -a /usr/local/bin/dirax
sudo chmod ugo+x /usr/local/bin/dirax
else
	:
fi

