#!/bin/bash

clear

echo "Wait... | make && ./keyz_out"
echo "> cd build && rm ./keyz_out && make"

cd build && rm ./keyz_out && make 

echo "[*] Finished." 
echo "[I]: To run file press any key..."
read -n 1
clear
./keyz_out