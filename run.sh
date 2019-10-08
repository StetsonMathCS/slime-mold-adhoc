#!/bin/bash

cd ns-allinone-3.29/ns-3.29/
python3 waf configure --enable-examples --enable-tests --disable-werror
#python3 waf clean
python3 waf build --disable-werror
d=../../output/`date +'%Y%m%d_%H%M%S'`
mkdir -p $d/olsr
mkdir -p $d/aodv
mkdir -p $d/oplsr
python3 waf --run "manet-routing-compare2 --protocol=1" #--command-template="gdb --args %s <args>"
mv manet-routing* $d/olsr
python3 waf --run "manet-routing-compare2 --protocol=2" #--command-template="gdb --args %s <args>"
mv manet-routing* $d/aodv
python3 waf --run "manet-routing-compare2 --protocol=0" #--command-template="gdb --args %s <args>"
mv manet-routing* $d/oplsr

