#!/bin/bash

read -r  -n 1 -p "Install packages: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	sudo apt install build-essential
	sudo apt install libhdf5-dev libgsl-dev
	sudo apt install libgtk2.0-dev \
                     libcairo2-dev \
					 libpango1.0-dev \
					 libgdk-pixbuf2.0-dev \
					 libfftw3-dev \
					 libcbf-dev \
					 libncurses5-dev \
					 libpng-dev \
					 libtiff5-dev
	sudo apt-get install cmake
else
	:
fi


read -r  -n 1 -p "Get CrystFEL: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	wget http://www.desy.de/~twhite/crystfel/crystfel-0.8.0.tar.gz .
else
	:
fi

read -r  -n 1 -p "Unpack CrystFEL: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	tar -xzf crystfel-0.8.0.tar.gz
	cd crystfel-0.8.0
else
	:
fi

read -r  -n 1 -p "Unpack CrystFEL: " 'mainmenuinput'
if [[ "$mainmenuinput" = "y" ]]; then
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
else
	:
fi


