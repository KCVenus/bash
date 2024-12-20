#!/bin/bash

sens="-up"
col=0

while [[ $1 == -* ]]; do
    case "$1" in
        -up|-down)
            sens="$1"
            shift
            ;;
        -c)
            shift
            col="$1"
            shift
            ;;
        *)
            echo "Option inconnue: $1"
            exit 1
            ;;
    esac
done

fichier="$1"

if [ ! -f "$fichier" ]; then
    echo "Fichier non valide"
    exit 1
fi

IFS=$'\n' read -d '' -r -a lignes < "$fichier"
n=${#lignes[@]}

for (( i=0; i<n; i++ )); do
    for (( j=0; j<n-i-1; j++ )); do
        val1=$(echo "${lignes[j]}" | cut -d';' -f$((col+1)))
        val2=$(echo "${lignes[j+1]}" | cut -d';' -f$((col+1)))
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
