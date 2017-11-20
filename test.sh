#!/bin/sh
echo "##########################################################################"
echo "Test the CPU"
sysbench --test=cpu --cpu-max-prime=20000 run

echo "##########################################################################"
echo "Test File IO"
sysbench --test=fileio --file-total-size=2G prepare
sysbench --test=fileio --file-total-size=2G --file-test-mode=rndrw --init-rng=on --max-time=300 --max-requests=0 run
sysbench --test=fileio --file-total-size=2G cleanup

echo "##########################################################################"
echo "Test Memory R/W"
sysbench --test=memory run --memory-total-size=2G
sysbench --test=memory run --memory-total-size=2G --memory-oper=read

echo "##########################################################################"
echo "End Tests"
echo "##########################################################################"
