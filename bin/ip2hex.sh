#!/bin/sh

# convert IP addres to HEX value
# For example : 10.0.0 - 0a0000

echo "Please input SUBNET or IP, for example 10.0.0"
read IP_ADDR
filename=$(printf '%02X' ${IP_ADDR//./ })
cd /tftpboot/pxelinux.cfg/
lowerfilename=${filename,,}
ln -s /tftpboot/pxelinux.cfg/default /tftpboot/pxelinux.cfg/$lowerfilename
