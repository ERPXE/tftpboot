#!/bin/sh

# convert IP addres to HEX value
# For example : 10.0.0 - 0a0000
# This will generate a link at $TFTPFOLDER/0a0000 
# to default to load ERPXE faster for your IP/Subnet
# as Syslinux searching for this file before calling default.
# c0a800 (192.168.0.*) / 0a0000 (10.0.0.*) supplied by ERPXE as default
# links supplied by default for 192.168.*.* / 192.*.*.* and 10.0.*.* / 10.*.*.* also.

# TFTP Folder
TFTPFOLDER=/tftpboot/pxelinux.cfg

echo "Please input SUBNET or IP, for example 10.0.0"
read IP_ADDR

# Convert values to Hex
filename=$(printf '%02X' ${IP_ADDR//./ })

# Convert to lowercase
lowerfilename=${filename,,}

# Check If File Exist
cd $TFTPFOLDER/
if [ -f $lowerfilename ];
then
   echo "File $lowerfilename already exists."
else
   ln -s $TFTPFOLDER/default $TFTPFOLDER/$lowerfilename
fi
