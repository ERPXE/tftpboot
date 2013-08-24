#! /bin/bash

echo "Fix files and folders ownership and permissions"
echo ""
echo "Set ownership to user root and group root"
chown root:root /tftpboot/ -R
echo "Set files permissions 644"
chmod 644 /tftpboot/ -R
echo "Set folder permissions 755"
find /tftpboot/ -type d -print | xargs chmod 755
echo "Reset script permissions"
chmod 755 /tftpboot/bin/* -R
echo ""
echo "Done"
