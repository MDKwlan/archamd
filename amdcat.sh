cp pacman.conf /etc/pacman.conf
cp radeon.conf /etc/modules-load.d/
cp mkinitcpio.conf /etc/mkinitcpio.conf
pacman-key -r 653C3094
pacman-key --lsign-key 653C3094
pacman -Syy
pacman -S catalyst-hook catalyst-utils catalyst-libgl opencl-catalyst lib32-catalyst-utils lib32-catalyst-libgl lib32-opencl-catalyst
aticonfig --initial
systemctl enable catalyst-hook
systemctl start catalyst-hook