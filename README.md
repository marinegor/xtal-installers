## Content

Has following packages:

  - XDS: [link](https://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/Installation)
  - all XDS-related stuff (excluding Neggia): [link](https://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/Installation)
  - Dirax: [link](https://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/Installation)
  - CrystFEL: [link](http://www.desy.de/~twhite/crystfel/install.html)
  	- and xgandalf: [link](https://stash.desy.de/users/gevorkov/repos/xgandalf/browse)
  - :copyright: CCP4 package: [link](http://www.ccp4.ac.uk/download/#os=linux)
  - :copyright: autoBUSTER package: [link](https://www.globalphasing.com/buster/manual/autobuster/manual/autoBUSTER2.html)
  - :copyright: Phenix package: [link](https://www.phenix-online.org/download/)
 
Tested on Ubuntu 18.04 (WSL under Win10 and fresh GCP instance running Ubuntu 18.04).
All software tagget :copyright: is free only for academics, and this gist does not provide full links to their source code.

## Usage
Usage of any script is following:

```bash
bash install_<packagename>.sh
```
and enter `y` any time you really want to do the part of the job -- this is done to avoid e.g. unnecessary re-download of all shit.

Usage of `install_{buster,ccp4,phenix}.sh` requires installation of python `pip` package manager (specifically, it does `sudo apt-get install python3-pip`). Please make sure you ran `sudo apt-get update` before installing it -- it won't install otherwise.
