#!/bin/bash

# Tested on: CentOS 6.4

# Clear Screen
clear

# Prompt notification:
cat setup/notice.txt

# Ask to continue after notice
echo "Do you want to continue ERPXE DHCP server configuration ? [y/N]"
read AGREE
if [ "$AGREE" != "y" -a "$AGREE" != "Y" ] ; then
    exit
fi

# ask if to enable DHCP service
echo "Do you want to use ERPXE DHCP server ? [y/N]"
read DHCP

# Install packages
yum install -y dhcp httpd nfs-utils samba xinetd tftp wget tar gzip

# Backup original files to .erpxe
cp /etc/exports /etc/exports.erpxe
cp /etc/samba/smb.conf /etc/samba/smb.conf.erpxe
cp /etc/xinetd.d/tftp /etc/xinetd.d/tftp.erpxe

# Copy configuration files to appropriate locations
cat setup/erpxe-exports > /etc/exports
cat setup/erpxe-httpd.conf > /etc/httpd/conf.d/erpxe.conf
cat setup/erpxe-smb.conf > /etc/samba/smb.conf
cat setup/erpxe-tftp > /etc/xinetd.d/tftp

# Restart services
service httpd restart
service nfs restart
service smb restart
service xinetd restart

# Configure services to run at startup
chkconfig httpd on
chkconfig nfs on
chkconfig smb on
chkconfig tftp on
chkconfig xinetd on

# If DHCP is enabled then create the conf and configure the service
if [ "$DHCP" == "y" -o "$DHCP" == "Y" ] ; then
    # get IP address
    echo ""
    echo "Please input your server IP address : [10.0.0.1]"
    read IPAddress
    if [ -z $IPAddress ] ; then
	IPAddress="10.0.0.1"
    fi
    # Replace Server IP in dhcpd.conf
    sed -e "s/10.0.0.1/$IPAddress/g" setup/erpxe-dhcpd.conf > /etc/dhcp/dhcpd.conf
    # Start dhcpd service and run on startup
    chkconfig dhcpd on
    service dhcpd restart
else
    echo "Add the following rules to your dhcp server:"
    echo ""
    echo "next-server IP-ADDRESS;"
    echo 'filename "pxelinux.0";'
fi
echo ""
echo ""
echo "All Done! - Enjoy ERPXE"
echo "visit our website for more information: http://erpxe.com"
