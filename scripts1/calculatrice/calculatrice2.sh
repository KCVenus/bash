#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Opérande manquant"
    exit 1
fi

res="$1"
affichage="$1"
shift

while [ $# -gt 0 ]
do
    op="$1"
    if [ $# -lt 2 ]; then
        echo "$affichage $op -> Opération non traitée"
        exit 1
    fi
    shift
    val="$1"
    shift

    affichage="$affichage $op $val"

    case "$op" in
        +)
            res=$(expr $res + $val)
            ;;
        -)
            res=$(expr $res - $val)
            ;;
        x)
            res=$(expr $res \* $val)
            ;;
        /)
            if [ "$val" -eq 0 ]; then
                echo "$affichage -> Division par 0 interdite"
                exit 1
            fi
            res=$(expr $res / $val)
            ;;
        *)
            echo "$affichage -> Opération non traitée"
            exit 1
            ;;
    esac
done

echo "$affichage = $res"
