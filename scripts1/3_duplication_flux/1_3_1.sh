#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <fichier>"
    exit 1
fi

if [ -d "$1" ]; then
    echo "Erreur: $1 est un répertoire."
    exit 1
fi

# Ok
exit 0
