#!/bin/bash
# Descripción: Script para conectarse a la máquina bandit de OverTheWire
# Author: antonio

# Colores
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

IP="bandit.labs.overthewire.org"
PORT="2220"
USER="bandit"
NUM=$1
PASS=$2

if [ -z "$NUM" ]; then
    echo -e "${red}Usage:${end} ${blue}bandit${end} ${yellow}<level number> <password>${end}"
    exit 1
fi

if [ -z "$PASS" ]; then
    echo -e "${red}Usage:${end} ${blue}bandit${end} ${yellow}<level number> <password>${end}"
    exit 1
fi

sshpass -p "$PASS" ssh -p "$PORT" "$USER$NUM"@"$IP"
