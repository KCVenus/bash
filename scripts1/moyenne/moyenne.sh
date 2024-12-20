#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <fichier>"
    exit 1
fi

fichier="$1"

if [ ! -f "$fichier" ]; then
    echo "Fichier non valide"
    exit 1
fi

while IFS=';' read -r nom prenom n1 n2 n3 n4
do

    sum=$(expr $n1 + $n2 + $n3 + $n4)
    moy=$(expr $sum / 4)
    echo "$nom $prenom $moy"
done < "$fichier"
