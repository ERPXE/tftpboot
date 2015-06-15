IPAddress=$1
if [ -z $IPAddress ] ; then
  echo ""
  echo "Please input your server IP address : [10.0.0.1]"
  read IPAddress
  if [ -z $IPAddress ] ; then
    IPAddress="10.0.0.1"
  fi
fi
find /tftpboot -type f |grep '\.menu$' | while read file
do
echo "$file"
sed "-i.`date +%F-%H%M%S`.bak" -r  's/nfsroot=(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/nfsroot=$IPAddress/ "$file"
sed "-i.`date +%F-%H%M%S`.bak" -r  's/NFS=(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/NFS=$IPAddress/g "$file"
done
