#!/bin/bash -e

apt update
 if [[ "${OS}" == "debian" ]]; then
 #fix radxa's fuckup
 export DISTRO=bullseye-stable
 wget -O - apt.radxa.com/$DISTRO/public.key | sudo apt-key add - 
 sudo apt update
 sudo apt-mark hold linux-5.10-rock-5-latest
 sudo apt upgrade
 fi
echo "we've now entered a chroot environment, everything should be copied into /opt"
cd /opt
ls -a
cd additionalFiles
ls -a
cd *
ls -a
bash build_chroot.sh
echo "after building we can now push the contents outside the chroot"

