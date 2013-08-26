#! /bin/bash

function resetPermissions() {
    echo "Fix files and folders ownership and permissions"
    echo "Set ownership to user root and group root"
    chown root:root /tftpboot/ -R
    echo "Set files permissions 644"
    chmod 644 /tftpboot/ -R
    echo "Set folder permissions 755"
    find /tftpboot/ -type d -print | xargs chmod 755
    echo "Reset script permissions"
    chmod 744 /tftpboot/bin/ -R
}

path="/tftpboot/";
echo "Reseting $path permissions.";
read -r -p "Are you sure? [Y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        resetPermissions;
        echo "Done."
        ;;
    *)
        echo "Aborting."
        ;;
esac
