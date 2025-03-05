echo enable /swapfile
sudo swapon /swapfile

echo mounting chroot
sudo mount --bind /dev /chroot/debian/dev
sudo mount --bind /proc /chroot/debian/proc
sudo mount --bind /sys /chroot/debian/sys
sudo mount --bind /run /chroot/debian/run

echo starting chroot
sudo chroot /chroot/debian /bin/bash -c "export HOME=/root; export LC_ALL=C; sh /root/start.sh"

echo unmounting chroot
sudo umount /chroot/debian/dev
sudo umount /chroot/debian/proc
sudo umount /chroot/debian/sys
sudo umount /chroot/debian/run

echo disable /swapfile
sudo swapoff -v /swapfile