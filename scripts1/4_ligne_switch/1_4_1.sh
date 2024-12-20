#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <fichier1> <fichier2>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Erreur: $1 n'est pas un fichier existant."
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Erreur: $2 n'est pas un fichier existant."
    exit 1
fi

exit 0
É