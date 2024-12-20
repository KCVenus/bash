#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 <nom_fichier> <texte>"
    exit 1
fi

fichier="$1"
shift
texte="$*"

echo "$texte" > "$fichier"
