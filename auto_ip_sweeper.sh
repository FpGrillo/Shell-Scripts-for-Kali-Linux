#!/bin/bash
# Simple tool that detects hosts in use inside your /24 private network
echo "#    #   ##     #    #     #            #    # #    #   #"
echo "##  ##  # #     ##   #     #            ##  ## #    #   #"
echo "# ## #    #     # #  #     #            # ## # #######  #"
echo "#    #    #     #  # #     #            #    #      #   #"
echo "#    #    #     #   ##     #            #    #      #   #"
echo "#    #  #####   #    #     #   #######  #    #      #   #####"
echo 
echo
echo "Auto Ip Sweeper 1.0 For Kali Linux By: m1ni_m4l"
echo 
echo  "Internal Network Prefix:"
echo
# Discover network prefix
inet="$(ip a | grep "eth0" | cut -d " " -f 06 | tr -d "qdics" | cut -d "." -f 1,2,3)"
echo $inet
echo
echo "Hosts Found:"
echo
# Execute ping command to check hosts in use
for ip in `seq 1 254`; do
ping -c 1 $inet.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &



done
