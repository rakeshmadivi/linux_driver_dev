#!/bin/bash

# Requirements
echo Installing the required packages and tools needed for the kernel compilation
sudo apt-get install build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison git fakeroot


# Kernels Available in:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

echo Downloading Required Kernel
kernel=linux-5.0-rc3.tar.gz
wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/${kernel}

tar -xvf $kernel
cd `echo $kernel | sed -e 's/.tar.gz//'`

echo Select the options in dialog box to be shown to you...; sleep 2

save_to=.config
echo saving the present configuration to: ${PWD}/${save_to}
cp /boot/config-$(uname -r) $save_to
make menuconfig

echo Compiling with set configuration...; sleep 2
make -j `nproc`

echo Installing Compiled Modules....; sleep 2
make modules_install

echo Installing the Compiled Kernel; sleep 2
sudo make install

echo Enabling the kernel for boot...; sleep 2
sudo update-initramfs -c -k `echo $kernel | sed -e 's/linux-//'|sed -e 's/.tar.gz//'`

echo Updating the Grub...; sleep 2
sudo update-grub

echo Now you can restart the system and select the compiled kernel in the options...
