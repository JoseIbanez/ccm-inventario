#!/bin/sh

while read line 
do
  ./send.py $1 $line 	
done


