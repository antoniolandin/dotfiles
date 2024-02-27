#!/bin/bash

# Ctr + C to stop the script
trap ctrl_c INT

function ctrl_c() {
        echo -e "\n\n[!] Exiting...\n"
        exit 1
}

for ip in $(seq 1 254); do
        ping -c 1 192.168.1.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 &
done

