#!/bin/sh


while read file
do
  ./Modelo-7912G.sh $file
  ./Modelo-7921G.sh $file
  
done


