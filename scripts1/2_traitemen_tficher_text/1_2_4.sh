#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <fichier> <numero_mot>"
    exit 1
fi

fichier="$1"
n="$2"

if [ ! -e "$fichier" ]; then
    echo "Erreur: $fichier n'existe pas."
    exit 1
fi

if [ -d "$fichier" ]; then
    echo "Erreur: $fichier est un répertoire."
    exit 1
fi

while read -r line
do
    if [ -n "$line" ]; then
        num=0
        for mot in $line
        do
            num=$(expr $num + 1)
            if [ $num -eq $n ]; then
                echo "$mot"
            fi
        done
    fi
done < "$fichier"
