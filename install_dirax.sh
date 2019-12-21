#!/bin/bash

read -r  -n 1 -p "Install libgfortran " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	sudo apt-get install libgfortran3
else
	:
fi

read -r  -n 1 -p "Download and install Dirax: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	curl -L "http://www.crystal.chem.uu.nl/distr/dirax/download/dirax1.17-Linux-x86_64.tar.Z" -o dirax.tar.Z
	mkdir dirax
	mv dirax.tar.Z dirax/
	cd dirax || return
	uncompress dirax.tar.Z
	tar -xvf dirax.tar
	echo """
#!/bin/sh
exec ${PWD}/dirax \"\$@\"
""" | sudo tee -a /usr/local/bin/dirax
sudo chmod ugo+x /usr/local/bin/dirax
else
	:
fi 
