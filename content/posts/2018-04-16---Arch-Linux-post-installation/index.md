+++
title='Arch Linux post installation'
date='2018-04-16'
slug='arch-linux-post-installation'
categories=['Linux', 'Tech']
tags=['arch', 'arch linux', 'linux', 'post installation']
description='Post installation steps for arch linux users including user management and installation of apps.'
+++

### Update your system

```sh
pacman -Syu
```

### Install X server, Desktop Environment and Display Manager

```sh
pacman -S xorg
```

To install GNOME:

```sh
pacman -S gnome gnome-extra
```

To install Cinnamon:

```sh
pacman -S cinnamon nemo-fileroller
```

To install XFCE:

```sh
pacman -S xfce4 xfce4-goodies
```

To install KDE:

```sh
pacman -S plasma
```

To install MATE:

```sh
pacman -S mate mate-extra
```

To install a display manager:

```sh
pacman -S lightdm
systemctl enable lightdm.service
```

### Add user

```sh
# Add new user
useradd -m -G wheel -s /bin/bash username
passwd username

# Uncomment wheel group
visudo
%wheel ALL=(ALL) ALL

# Install sudo package
pacman -S sudo
```

### Install yaourt

Add followings to `/etc/pacman.conf`:

```sh
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

```sh
pacman -Syu yaourt
```

### Install applications

- Internet

  ```sh
  pacman -S firefox
  pacman -S chromium
  pacman -S opera
  ```

  ```sh
  yaourt -S google-chrome
  yaourt -S skypeforlinux-stable-bin
  ```

- Fonts

  ```sh
  pacman -S ttf-hack
  pacman -S noto-fonts
  pacman -S ttf-symbola
  pacman -S ttf-indic-otf
  pacman -S noto-fonts-extra
  pacman -S noto-fonts-emoji
  pacman -S adobe-source-code-pro-fonts
  ```

  ```sh
  yaourt -S ttf-monaco
  ```

- Text Editors

  Install Sublime Text from [here](https://www.sublimetext.com/docs/3/linux_repositories.html#pacman).

  ```sh
  pacman -S atom
  ```

  ```sh
  yaourt -S visual-studio-code-bin
  yaourt -S webstorm
  yaourt -S datagrip
  ```

- Media Players

  ```sh
  pacman -S mpv
  pacman -S vlc
  ```

- Utilities

  ```sh
  pacman -S redshift
  pacman -S htop
  pacman -S powertop
  pacman -S gparted
  ```

- Power management

  ```sh
  pacman -S tlp
  systemctl enable tlp.service
  ```

- Download manager

  ```sh
  pacman -S aria2
  pacman -S qbittorent
  ```

**Reboot and enjoy!**

#### References

- [7 Essential Things To Do After Installing Arch Linux](https://itsfoss.com/things-to-do-after-installing-arch-linux/)
- [Arch Linux Post Installation (30 Things to do after Installing Arch Linux)](https://www.2daygeek.com/arch-linux-post-installation-30-things-to-do-after-installing-arch-linux/2/)
