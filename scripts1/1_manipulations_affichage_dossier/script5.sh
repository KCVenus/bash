#!/bin/bash

count=1

for(( i = 1 ; i <= 10 ; i++ ))
do
   echo  $2 > $i"_"$1
   
done
