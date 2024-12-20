#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 <prefixe> <texte>"
    exit 1
fi

prefix="$1"
shift
texte="$*"

for i in $(seq 1 10)
do
    echo "$texte - numéro $i" > "${prefix}_${i}.txt"
done
