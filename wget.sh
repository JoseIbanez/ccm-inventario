#!/bin/sh

line=$1

touch ./gonv/$line-Intento
#curl $line -o ./gonv/$line    
wget --tries=5  http://$line -O ./gonv/$line-Index
wget --tries=5  --secure-protocol=TLSv1 --no-check-certificate https://$line/DeviceInformation -O ./gonv/$line-DeviceInformation

