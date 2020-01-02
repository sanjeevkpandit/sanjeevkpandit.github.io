---
title: Arch Linux post installation
date: '2018-04-16T00:00:00Z'
draft: false
slug: 'arch-linux-post-installation'
categories: ['Linux', 'Tech']
tags: ['arch', 'arch linux', 'linux', 'post installation']
description: 'Post installation steps for arch linux users.'
---

### Update your system

```console
# pacman -Syu
```

### Install X server, Desktop Environment and Display Manager

```console
# pacman -S xorg
```

To install GNOME:

```console
# pacman -S gnome gnome-extra
```

To install Cinnamon:

```console
# pacman -S cinnamon nemo-file-roller
```

To install XFCE:

```console
# pacman -S xfce4 xfce4-goodies
```

To install KDE:

```console
# pacman -S plasma
```

To install MATE:

```console
# pacman -S mate mate-extra
```

To install a display manager:

```console
# pacman -S lightdm
# systemctl enable lightdm.service
```

### Add user

```console
[Add new user]
# useradd -m -G wheel -s /bin/bash username
# passwd username

[Uncomment wheel group]
# visudo
%wheel ALL=(ALL) ALL

[Install sudo package]
# pacman -S sudo
```

### Install yaourt

Add followings to `/etc/pacman.conf`:

```console
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

```console
# pacman -Syu yaourt
```

### Install applications

- Internet

  ```console
  # pacman -S firefox
  # pacman -S chromium
  # pacman -S opera
  ```

  ```console
  $ yaourt -S google-chrome
  $ yaourt -S skypeforlinux-stable-bin
  ```

- Fonts

  ```console
  # pacman -S ttf-hack
  # pacman -S noto-fonts
  # pacman -S ttf-symbola
  # pacman -S ttf-indic-otf
  # pacman -S noto-fonts-extra
  # pacman -S noto-fonts-emoji
  # pacman -S adobe-source-code-pro-fonts
  ```

  ```console
  $ yaourt -S ttf-monaco
  ```

- Text Editors

  Install Sublime Text from <a href="https://www.sublimetext.com/docs/3/linux_repositories.html#pacman" target="_blank">here</a>.

  ```console
  # pacman -S atom
  ```

  ```console
  $ yaourt -S visual-studio-code-bin
  $ yaourt -S webstorm
  $ yaourt -S datagrip
  ```

- Media Players

  ```console
  # pacman -S mpv
  # pacman -S vlc
  ```

- Utilities

  ```console
  # pacman -S redshift
  # pacman -S htop
  # pacman -S powertop
  # pacman -S gparted
  ```

- Power management

  ```console
  # pacman -S tlp
  # systemctl enable tlp.service
  ```

- Download manager

  ```console
  # pacman -S aria2
  # pacman -S qbittorent
  ```

### Reboot and enjoy!

#### Reference:

- <a href="https://itsfoss.com/things-to-do-after-installing-arch-linux/" target="_blank">7 Essential Things To Do After Installing Arch Linux</a>
- <a href="https://www.2daygeek.com/arch-linux-post-installation-30-things-to-do-after-installing-arch-linux/2/" target="_blank">Arch Linux Post Installation (30 Things to do after Installing Arch Linux)</a>
