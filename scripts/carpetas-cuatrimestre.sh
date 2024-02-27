#!/bin/bash
# Descripcion: Script que crea las carpetas de un cuatrimestre
# Autor: Antonio

# Colores
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

asignaturas=("búsqueda-análisis-información" "cálculo-numérico" "desarrollo-aplicaciones-móviles" "procesamiento-datos" "programación-web-II-servidor")

ruta="$HOME/OneDrive/cursos/curso-2023-2024/cuatrimestre-2/"

echo -e "${green}Creando carpetas...${end}"

for asignatura in ${asignaturas[@]}
do
    mkdir -p $ruta$asignatura/temario
    mkdir -p $ruta$asignatura/ejercicios
    mkdir -p $ruta$asignatura/exámenes
done

echo -e "${green}Carpetas creadas con éxito en ${ruta} ${end}"
