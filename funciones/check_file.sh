#!/bin/bash

file_exists(){

if ! [ -f $archivo  ]; then
    
    echo "archivo ${archivo} no existe"
    echo "fin programa"
    exit
fi
}

files_exists(){
if (( $#<1 )); then
    echo "se necesitan archivos"

else
   

        for archivo in $@; do
        file_exists $archivo
        done


fi
}
