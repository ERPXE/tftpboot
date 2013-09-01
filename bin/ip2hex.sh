#!/bin/sh

# convert IP addres to HEX value
# For example : 10.0.0 - 0a0000
# This will generate a link at $TFTPFOLDER/0a0000 
# to default to load ERPXE faster for your IP/Subnet
# as Syslinux searching for this file before calling default.

# Settings
TFTPFOLDER = /tftpboot/pxelinux.cfg/ # TFTP Folder

echo "Please input SUBNET or IP, for example 10.0.0"
read IP_ADDR
filename=$(printf '%02X' ${IP_ADDR//./ })
cd $TFTPFOLDER
lowerfilename=${filename,,}
# TODO: CHECK IF FILE EXIST
ln -s /tftpboot/pxelinux.cfg/default /tftpboot/pxelinux.cfg/$lowerfilename
