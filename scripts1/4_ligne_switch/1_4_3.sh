#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <fichier1> <fichier2>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Erreur: $1 n'est pas un fichier."
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Erreur: $2 n'est pas un fichier."
    exit 1
fi

f1="$1"
f2="$2"

exec 3<"$f1"
exec 4<"$f2"

while true
do
    if ! read -r line1 <&3; then
        break
    fi
    if ! read -r line2 <&4; then
        break
    fi
    echo "$line1"
    echo "$line2"
done
