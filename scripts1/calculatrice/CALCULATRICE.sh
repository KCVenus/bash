#!/bin/bash

if [ $# -lt 2 ]; then
    if [ $# -eq 0 ]; then
        echo "Opération manquante"
    else
        echo "Opérande manquant"
    fi
    exit 1
fi

op="$1"
shift

if [ $# -lt 1 ]; then
    echo "Opérande manquant"
    exit 1
fi

res="$1"
shift

affichage="$res"

case "$op" in
    add)
        for a in "$@"
        do
            affichage="$affichage + $a"
            res=$(expr $res + $a)
        done
        ;;supp)
        for a in "$@"
        do
            affichage="$affichage - $a"
            res=$(expr $res - $a)
        done
        ;;mult)
        for a in "$@"
        do
            affichage="$affichage * $a"
            res=$(expr $res \* $a)
        done
        ;;
    div)
        # division
        for a in "$@"
        do
            if [ "$a" -eq 0 ]; then
                echo "$affichage / $a : Division par 0 interdite"
                exit 1
            fi
            affichage="$affichage / $a"
            res=$(expr $res / $a)
        done
        ;;
    *)
        echo "Opération inconnue"
        exit 1
        ;;
esac

echo "$affichage = $res"
