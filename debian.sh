	sudo mount --bind /dev /chroot/debian/dev
	sudo mount --bind /proc /chroot/debian/proc
	sudo mount --bind /sys /chroot/debian/sys
	sudo mount --bind /run /chroot/debian/run
	
	sudo chroot /chroot/debian /bin/bash -c "export HOME=/root; export LC_ALL=C; exec bash"
	
	sudo umount /chroot/debian/dev
	sudo umount /chroot/debian/proc
	sudo umount /chroot/debian/sys
	sudo umount /chroot/debian/run