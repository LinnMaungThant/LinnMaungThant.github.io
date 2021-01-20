#! /bin/bash
#

echo User Information Report Generated to $(pwd)/userinfo_$(hostname).txt
echo "If you don't found, use chmod +xw user-enum.sh command to give permission"
exec &> userinfo_$(hostname).txt

date
echo
echo Hostname - $(hostname)
echo
echo IP - $(hostname -I)
echo
echo ++++++++++++++++++++++++++++++++
echo "list all users and their groups"
echo ++++++++++++++++++++++++++++++++

for i in $(cat /etc/passwd  | cut -d: -f1); do
   echo -n $i ": "
   grep $i /etc/group | cut -d: -f1 | tr "\n" " "
   echo
done

echo --------------------------------
echo
echo ++++++++++++++++++++++++++++++++
echo "list normal users"
echo ++++++++++++++++++++++++++++++++

eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)}
echo --------------------------------
echo
echo ++++++++++++++++++++++++++++++++
echo "list system users"
echo ++++++++++++++++++++++++++++++++

eval getent passwd {$(awk '/^SYS_UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^SYS_UID_MAX/ {print $2}' /etc/login.defs)}
echo ++++++++++++++++++++++++++++++++
eval getent passwd {$(awk '/^#SYS_UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^#SYS_UID_MAX/ {print $2}' /etc/login.defs)}
echo --------------------------------
echo
echo ++++++++++++++++++++++++++++++++
echo "list predefined users"
echo ++++++++++++++++++++++++++++++++

getent passwd {0..99}
echo --------------------------------
