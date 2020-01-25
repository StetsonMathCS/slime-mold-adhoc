#!/bin/bash

cd ns-allinone-3.29/ns-3.29/
python3 waf configure --enable-examples --disable-werror --disable-python || exit
python3 waf clean
python3 waf build --disable-werror || exit
d=../../output/`date +'%Y%m%d_%H%M%S'`
mkdir -p $d/olsr
mkdir -p $d/aodv
mkdir -p $d/oplsr
NS_LOG='*=level_debug' python3 waf --run "manet-routing-compare2-with-energy --protocol=0" 2> $d/oplsr/log.txt #--command-template="gdb --args %s <args>"
#python3 waf --run "manet-routing-compare2-with-energy --protocol=0" #--command-template="gdb --args %s <args>"
mv manet-routing* $d/oplsr
#NS_LOG='*=level_info' python3 waf --run "manet-routing-compare2-with-energy --protocol=1" 2> $d/olsr/log.txt #--command-template="gdb --args %s <args>"
#python3 waf --run "manet-routing-compare2-with-energy --protocol=1" #--command-template="gdb --args %s <args>"
#mv manet-routing* $d/olsr
#NS_LOG='*=level_info' python3 waf --run "manet-routing-compare2-with-energy --protocol=2" 2> $d/aodv/log.txt #--command-template="gdb --args %s <args>"
#python3 waf --run "manet-routing-compare2-with-energy --protocol=2" #--command-template="gdb --args %s <args>"
#mv manet-routing* $d/aodv

