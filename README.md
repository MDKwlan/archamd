archamd
=======

Adding unoffical Arch repos for AMD drivers
This is a quick and dirty way of adding new repos signing them updating pacman initializing xorg to function and to
enable hook on reboot.

The pacman.conf is based off Central North American location so if your mirror list is set to another country
you might notice that speeds are slow. Feel free to edit or comment out the .conf and only take what was changed.

The pacman.conf also has multilib support. This is not needed for pure64bit machines but if you're intention is to ever
run steam you're going to need multilib support. Multilib is not needed for x86 machines, but as of right now there seems
to be no harm in enabling it. If you are running x86 please comment out the libs that are listed in the pacman -S because
they are not needed in your build of Arch.


The mkinitcpio.conf is just a normal mkinitcpio.conf with nomodeset enabled which is needed to disable KMS.
The Arch wiki suggests that KMS needs to be disabled to prevent bugs with the drivers.

The Radeon.conf is for blacklisting the FOSS drivers and enabling fglrx. You should get an error on boot saying that 
the FOSS drivers couldnt be loaded which is the whole point of disabling it.


amdcat.sh is the core of this whole project. Chmod 777 or chmod +X to enable it to run. Be sure to be within the
directory when running ./amdcat.sh as the script depends on your location. Also be sure to run this as root.
In a further revision I'll add sudo but as of right now It's assumed that your only user will be root.

Please note that this should ONLY be used when doing a fresh install. This is not ment to roll back Xorg or uninstall
FOSS drivers. If you use it to roll Xorg back it might not work as intended.
