cp pacman.conf /etc/pacman.conf #This pacman.conf has multilib xorg116 and catalysts repo
cp radeon.conf /etc/modules-load.d/ #This will add the blacklist for the radeon FOSS driver and add fglxr to start
cp mkinitcpio.conf /etc/mkinitcpio.conf #This will add nomodeset to disable KMS.
pacman-key -r 653C3094 #Vi0l0s key for verifying the new repos added in pacman.conf
pacman-key --lsign-key 653C3094 #This is mainly a backup if -r fails.
pacman -Syy #Updating all the new repos that have been added
pacman -S catalyst-hook catalyst-utils catalyst-libgl opencl-catalyst lib32-catalyst-utils lib32-catalyst-libgl lib32-opencl-catalyst
#Giant list of files that are needed. Some can be removed if needed.
aticonfig --initial #The initial config for xorg via amd
systemctl enable catalyst-hook #Enables catalyst-hook which rebuilds mkinitcpio every new kernel
systemctl start catalyst-hook #Enables it to run after this config.