#!/bin/bash
#afficher le nombre et les param
count = 1


echo "il ya :  $# param passer en param"


for param in "$@"
do
   echo "\$@ Parametre #$count = $param"
   count=$[ $count + 1 ]
done

