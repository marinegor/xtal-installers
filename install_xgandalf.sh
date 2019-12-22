#!/bin/bash

read -r  -n 1 -p "Clone and install xgandalf (one of CrystFEL indexers):dependencies: " 'mainmenuinput' 
if [[ "$mainmenuinput" == "y" ]]; then
	git clone https://stash.desy.de/scm/~gevorkov/xgandalf.git 
	cd xgandalf || return
	mkdir cmakeBuild
	cd cmakeBuild || return
	cmake ..
	make
	sudo make install
else
	:
fi
