#!/bin/bash

if [ $# != 2 ] ; then
   echo "le nombre de parametre est incorecte, il faut faire : ./script4.sh nom_fichier text" 
else
echo $2 >> $1
fi

