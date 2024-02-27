#!/bin/bash

for port in $(seq 31000 32000); do
    (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] Port $port is open" &
done; wait

