#!/bin/sh

file=$1

grep 'CP-7912G$' $1 > /dev/null || exit

sed -i 's@TD@td@g' $1

serial=`cat $file   | grep 'Serial'            | sed 's@.*<td>@@'`
product=`cat $file  | grep 'Product ID'        | sed 's@.*<td>@@'`
mac=`cat $file      | grep 'MAC'               | sed 's@.*<td>@@'`
name=`cat $file     | grep 'Host Name'         | sed 's@.*<td>@@'`
version=`cat $file  | grep 'Software Version'  | sed 's@.*<td>@@'`
dir=`cat $file      | grep 'Phone DN'          | sed 's@.*<td>@@'`




echo "$file,$product,$serial,$mac,$name,$version,$dir" #>> gonv.list

