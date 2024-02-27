#!/bin/bash
# Description: Otra forma de conseguir la contraseña de la máquina bandit12 de OverTheWire
# Author: antonio

# Convertimos el arhivo hexadecimal data.txt a binario
xxd -r data.txt > data

# Obtenemos el tipo de archivo
info=$(file data)

# Mientras el archivo no sea de tipo ASCII, lo descomprimimos
while [[ $info != *ASCII* ]]
do
    7z x data -so | sponge data 
    info=$(file data)
done

# Mostramos el contenido del archivo
cat data | awk '{print $NF}'
rm data
