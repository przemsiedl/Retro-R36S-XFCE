#!/bin/bash

echo XFCE install
progdir=$(dirname "$(realpath "$0")")

sudo apt update

#echo install openssh
#sudo apt install openssh-server -y
#sudo systemctl enable ssh
#sudo systemctl start ssh

echo installation debootstrap
sudo apt install debootstrap -y
sudo mkdir -p /chroot/debian
sudo debootstrap --arch arm64 stable /chroot/debian http://deb.debian.org/debian/

echo copying files
sudo cp $progdir/debian.sh /chroot/
sudo cp -R $progdir/root /chroot/debian

echo mounting chroot
sudo mount --bind /dev /chroot/debian/dev
sudo mount --bind /proc /chroot/debian/proc
sudo mount --bind /sys /chroot/debian/sys
sudo mount --bind /run /chroot/debian/run

echo installing graphical environment
sudo chroot /chroot/debian /bin/bash -c "export HOME=/root; export LC_ALL=C; apt update; apt install dbus-x11 xorg xfce4 qjoypad onboard pulseaudio pavucontrol -y"

echo unmounting chroot
sudo umount /chroot/debian/dev
sudo umount /chroot/debian/proc
sudo umount /chroot/debian/sys
sudo umount /chroot/debian/run

echo creating 512MB swap
sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile