#!/bin/bash

config_dir=/opt/ADMS

sudo apt-get install build-essential
sudo apt-get install automake libtool gperf flex bison
sudo apt-get install libxml2 libxml2-dev
sudo apt-get install libxml-libxml-perl
sudo apt-get install libgd-perl

git clone https://github.com/Qucs/ADMS.git

cd ADMS/

./bootstrap.sh

sudo mkdir -p $config_dir

sudo ./configure --prefix=$config_dir

sudo make install


