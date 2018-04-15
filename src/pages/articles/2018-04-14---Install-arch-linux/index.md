---
title: Install Arch Linux
date: "2018-04-14T00:00:00Z"
layout: post
draft: true
path: "/posts/install-arch-linux/"
category: "Tech"
tags:
  - "arch"
  - "arch linux"
  - "linux"
  - "setup"
  - "installation"
description: "Learn how to install arch linux."
---

It's been a long time since I have been using Arch Linux and loving it since because of its flexibility. In the mean time, I have installed the same OS for many times because I tried new things and crashed a lot of installed things. Literally, thinking about the time to repair, I just re-installed the OS. It just feels quick and easy to clear out all your garbage. However, it's a pain to setup all those applications and configuration. That's why I am writing this where I can find the steps I have been following to install and setup my machine my way :smile:.

Okay, let's start with the installation. Previously, I tried to run a live Ubuntu OS and then install either by the bootstrap image or using the LiveCD Image. But, nowadays, it seems the installing from live arch USB seems to be the easiest and quickest as it skips a lot of steps.

1. Connect to the internet
    * Use ethernet or run `wifi-menu` command to connect to a WiFi Connection.
    * Check connection:
    ```console
    ping archlinux.org
    ```

2. Partition the disks
    * The partitions can be listed from:
    ```console
    fdisk -l
    ```
    * Usually, I prefer to prepare the partition before the installation. Still, you can find the steps <a target="_blank" href="https://wiki.archlinux.org/index.php/installation_guide#Partition_the_disks">here</a> to perform the partition actions.
    * Format the partition
    ```console
    mkfs.ext4 /dev/sda1
    ```
