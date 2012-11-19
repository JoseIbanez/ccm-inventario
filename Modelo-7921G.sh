#!/bin/sh

file=$1

grep 'CP-792.G' $1 > /dev/null || exit

sed -i 's@TD@td@g' $1
sed -i 's@tr@tr@g' $1
sed -i 's@<tr>@\n<tr>@g' $1


ip=`echo $1 | sed 's@gonv/\(.*\)-DeviceInformation@\1@'`
serial=`cat $file   | grep 'Serial'            | sed 's@.*<td>@@'`
product=`cat $file  | grep 'Model Number'      | sed 's@.*<td>@@'`
mac=`cat $file      | grep 'MAC Address'       | sed 's@.*<td>@@'`
name=`cat $file     | grep 'Host Name'         | sed 's@.*<td>@@'`
version=`cat $file  | grep 'System Load ID'    | sed 's@.*<td>@@'`
dir=`cat $file      | grep 'Directory Number'  | sed 's@.*<td>@@'`




echo "$file,$ip,$product,$serial,$mac,$name,$version,$dir" | sed 's/ //g'  #>> gonv.list

