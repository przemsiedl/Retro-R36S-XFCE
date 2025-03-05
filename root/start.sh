echo Im in chroot. Starting GUI.

mount -t devpts devpts /dev/pts
pulseaudio --start
startx /usr/bin/startxfce4 -- :1

echo Bye. Leaving chroot.
echo stopping GUI