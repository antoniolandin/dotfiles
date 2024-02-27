#!/bin/bash
# Description: Script para resolver la máquina Bandit12 de OverTheWire: toma el archivo data.txt y lo descomprime hasta encontrar la contraseña
# Author: antonio

# Pasar el archivo data.txt de hexadecimal a binario
xxd -r data.txt > data

# Verificar el tipo de archivo
info=$(file data)

# Mientras el archivo sea de tipo gzip, bzip2 o tar, descomprimirlo
while [[ $info == *"gzip"* || $info == *"bzip2"* || $info == *"tar"* ]]; do
    case $info in
        *gzip*)
            mv data data.gz
            gzip -c -d data.gz > data
            rm data.gz
            info=$(file data)
            ;;
        *bzip2*)
            mv data data.bz2
            bzip2 -dc data.bz2 > data
            rm data.bz2
            info=$(file data)
            ;;
        *tar*)
            mv data data.tar
            tar xvf data.tar | xargs cat > data
            rm data.tar
            rm data*.bin
            info=$(file data)
            ;;
    esac
done

# Mostrar la contraseña
cat data | awk '{print $NF}'
rm data
