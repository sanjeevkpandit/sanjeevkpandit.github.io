+++
title='Install Arch Linux'
date='2018-04-14'
slug='install-arch-linux'
categories=['Linux', 'Tech']
tags=['arch', 'arch linux', 'linux', 'setup', 'installation']
description='Learn how to install arch linux.'
+++

It's been a long time since I have been using Arch Linux and loving it since because of its flexibility. In the mean time, I have installed the same OS for many times because I tried new things and crashed a lot of installed things. Literally, thinking about the time to repair, I just re-installed the OS. It just feels quick and easy to clear out all your garbage. However, it's a pain to setup all those applications and configuration. That's why I am writing this where I can find the steps I have been following to install and setup my machine my way :).

Okay, let's start with the installation. Previously, I tried to run a live Ubuntu OS and then install either by the bootstrap image or using the LiveCD Image. But, nowadays, it seems the installing from live arch USB seems to be the easiest and quickest as it skips a lot of steps.

1. Connect to the internet

   - Use ethernet or run `wifi-menu` command to connect to a WiFi Connection.
   - Check connection:

      ```sh
      ping archlinux.org
      ```

2. Partition the disks

   - The partitions can be listed from:

      ```sh
      fdisk -l
      ```

   - Usually, I prefer to prepare the partition before the installation. Still, you can find the steps [here](https://wiki.archlinux.org/index.php/installation_guide#Partition_the_disks) to perform the partition actions.
   - Format the partition

      ```sh
      mkfs.ext4 /dev/sda1
      ```

3. Mount the file system

    ```sh
    mount /dev/sda1 /mnt
    ```

4. Installation

   - Select and rank the mirrors, ranking the mirrors would help to perform the installation quicker.

     ```sh
     # Backup
     cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
     # Uncomment every mirror
     sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
     # Rank mirrors
     rankmirrors /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
     ```

   - Install the base packages:

     ```sh
     pacstrap /mnt base base-devel
     ```

     `base-devel` is optional, can be installed later.

5. Configure the system

   - Fstab

     ```sh
     genfstab -U /mnt >> /mnt/etc/fstab
     ```

   - Chroot

     ```sh
     arch-chroot /mnt
     ```

   - Time zone

     ```sh
     ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
     hwclock --systohc
     ```

   - Locale
     Uncomment `en_US.UTF-8 UTF-8` and other needed localizations in `/etc/locale.gen`, and generate them with:

     ```sh
     locale-gen
     ```

     Set the LANG variable in `/etc/locale.conf` accordingly:

     ```vim
     LANG=en_US.UTF-8
     ```

     To set the keyboard layout, make the changes persistent in `/etc/shell.conf`:

     ```vim
     KEYMAP=us
     ```

   - Hostname
     Create the `hostname` file `/etc/hostname`:

     ```sh
     myhostname
     ```

     Add matching entries to `/etc/hosts`:

     ```sh
     127.0.0.1    localhost
     ::1          localhost
     127.0.1.1    myhostname.localdomain  myhostname
     ```

   - Network configuration

     ```sh
     pacman -S networkmanager dhclient
     ```

     For wifi:

     ```sh
     pacman -S iw wpa_supplicant dialog
     ```

   - Initramfs

     ```sh
     mkinitcpio -p linux
     ```

   - Root password

     ```sh
     passwd
     ```

   - Boot loader (GRUB - UEFI)
     Install the package `grub` and `efibootmgr`:

     ```sh
     pacman -S grub efibootmgr
     ```

     Mount EFI partition(/dev/sda3):

     ```sh
     mkir /boot/efi
     mount /dev/sda3 /boot/efi
     ```

     Install GRUB UEFI to `/boot/efi`:

     ```sh
     grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub
     ```

     Generate the main configuration file:

     ```sh
     grub-mkconfig -o /boot/grub/grub.cfg
     ```

     _**Note:** For NVIDIA card holders, unless you install the `nvidia` drivers, add `modprobe.blacklist=nouveau` in `/etc/default/grub` and re-generate the main configuration file._

     ```sh
     GRUB_CMDLINE_LINUX_DEFAULT="quiet modprobe.blacklist=nouveau"
     ```

     _Remove `modprobe.blacklist=nouveau` after installing `nvidia` drivers._

6. Reboot, enjoy.
7. For post-installation steps, refer to [Arch Linux post installation](/posts/arch-linux-post-installation/).

#### References

- [Installation guide - Arch](https://wiki.archlinux.org/index.php/installation_guide)
