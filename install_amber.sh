#!/bin/bash

read -r  -n 1 -p "Install Amber with all dependencies: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	sudo apt -y install openmpi-bin libopenmpi-dev
	sudo apt -y install software-properties-common
	sudo add-apt-repository universe
	sudo apt -y update
	sudo apt -y install tcsh make \
	               gcc gfortran \
	               flex bison patch \
	               bc xorg-dev libbz2-dev wget
else
	:
fi
