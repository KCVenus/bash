#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <-up|-down> <fichier>"
    exit 1
fi

sens="$1"
fichier="$2"

if [ ! -f "$fichier" ]; then
    echo "Fichier non valide"
    exit 1
fi

if [ "$sens" != "-up" ] && [ "$sens" != "-down" ]; then
    echo "Sens non reconnu"
    exit 1
fi

IFS=$'\n' read -d '' -r -a lignes < "$fichier"

n=${#lignes[@]}
for (( i=0; i<n; i++ )); do
    for (( j=0; j<n-i-1; j++ )); do
        val1=$(echo "${lignes[j]}" | cut -d';' -f1)
        val2=$(echo "${lignes[j+1]}" | cut -d';' -f1)

        if [ "$sens" = "-up" ]; then
            if [[ "$val1" > "$val2" ]]; then
                tmp="${lignes[j]}"
                lignes[j]="${lignes[j+1]}"
                lignes[j+1]="$tmp"
            fi
        else
            if [[ "$val1" < "$val2" ]]; then
                tmp="${lignes[j]}"
                lignes[j]="${lignes[j+1]}"
                lignes[j+1]="$tmp"
            fi
        fi
    done
done
for l in "${lignes[@]}"
do
    echo "$l"
done
