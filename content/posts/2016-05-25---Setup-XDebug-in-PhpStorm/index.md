+++
date = '2016-05-25'
title = 'Setup XDebug in PhpStorm'
slug = 'setup-xdebug-in-phpstorm'
tags = ['php', 'xdebug', 'php-xdebug', 'phpstorm']
categories = ['Tech', 'Development']
description = 'Debug PHP code in PhpStorm using XDebug in Ubuntu'
+++

[PhpStorm](https://www.jetbrains.com/phpstorm/) is one of the good IDE for PHP application development available in current era. [PHP Xdebug](https://xdebug.org/) is a very strong tool for debugging, making the life easier for [PHP](http://www.php.net/) developers to find out the logical mistakes.

Integration of Xdebug into [PhpStorm](https://www.jetbrains.com/phpstorm/) will ease the trouble of debugging for [PHP](http://www.php.net/) developers. You can easily setup [Xdebug](https://xdebug.org/) in [PhpStorm](https://www.jetbrains.com/phpstorm/) by following these steps.

#### Requirements

- [PhpStorm](https://www.jetbrains.com/phpstorm/) (get it from [here](https://www.jetbrains.com/phpstorm/download/))
- [Xdebug](https://xdebug.org/) (get it from [here](https://xdebug.org/download.php))

#### Procedures

- Setup [Xdebug](https://xdebug.org/) (if you haven't done already). Find the steps [here](/posts/setup-xdebug-in-ubuntu).
  You should be able to see [Xdebug](https://xdebug.org/) while checking the php version.

  ```sh
  $ php --version
  PHP 7.0.7-2+donate.sury.org~xenial+1 (cli) ( NTS )
  Copyright (c) 1997-2016 The PHP Group
  Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
      with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
      with Xdebug v2.4.0, Copyright (c) 2002-2016, by Derick Rethans
  ```

- Now, configure xdebug for debugging. You need to change the `xdebug.ini` file. You can find the location of file using this command using terminal: `php --ini | grep xdebug`.

Mine returned like this:

```sh
$ php --ini | grep xdebug
/etc/php/7.0/cli/conf.d/20-xdebug.ini,
```

- Just copy the path of the file and open in your favourite text editor ([Sublime Text](https://www.sublimetext.com/) for me). Don't forget to use `sudo` to edit the file otherwise, you won't be able to save the changes you make.

  ```sh
  # for sublime text users
  $ sudo subl /etc/php/7.0/cli/conf.d/20-xdebug.ini

  # for gedit users
  $ sudo gedit /etc/php/7.0/cli/conf.d/20-xdebug.ini

  # for vim users
  $ sudo vim /etc/php/7.0/cli/conf.d/20-xdebug.ini

  # for atom users
  $ sudo atom /etc/php/7.0/cli/conf.d/20-xdebug.ini
  ```

- Add these lines of code at the end of file.

  ```sh
  xdebug.remote_enable=true
  xdebug.remote_port="9000"   // Port for xdebug. Default is 9000.
  xdebug.profiler_enable=1
  xdebug.profiler_output_dir="/tmp"
  ```

- Time to change things in [PhpStorm](https://www.jetbrains.com/phpstorm/). Navigate to `File > Settings > Language & Frameworks > PHP`. You will see the following screen.

  ![PhpStorm PHP](./xdebug-phpstorm-1.png)

  Click on the `...` in `Interpreters` option to see more. You will get this:

  ![PhpStorm PHP Debugger](./xdebug-phpstorm-2.png)

  If you are not able to see `Debugger: Xdebug 2.4.0`, try to refresh by clicking the refresh button on the right of `PHP exectable`. Again, if not seen, check the status of [Xdebug](https://xdebug.org/) and try again.

  This shows that that [Xdebug](https://xdebug.org/) is ready in [PhpStorm](https://www.jetbrains.com/phpstorm/). Save before you exit!

- Now, you need to set up a server. Navigate to `File > Settings > Language & Framework > PHP > Servers`.

  ![PhpStorm PHP Servers](./xdebug-phpstorm-3.png)

  Let's add a server. Click on **+** icon to add. You will get the same window changed to this:

  ![PhpStorm PHP Servers - Add new](./xdebug-phpstorm-4.png)

  By default, it tries to create a unnamed server. Let's change this to `TEST_SERVER` and fill the other fields as well as shown below.

  ![PhpStorm PHP Servers - Test Server](./xdebug-phpstorm-5.png)

  Choose `Xdebug` as the `Debugger` option on the right. You can choose different port (default is 80).

  Save before you close the window!

- Now a server is ready, configure debug options. Navigate to `Run > Edit Configurations`.

  ![PhpStorm PHP Servers - Configure Debug Options](./xdebug-phpstorm-6.png)

  Add new option by clicking on **+** icon on top left. Choose `PHP Web Application` from number of options.

  ![PhpStorm PHP Servers - New Configuration](./xdebug-phpstorm-7.png)

  You will get a unnamed configuration as shown below.

  ![PhpStorm PHP Servers - PHP Web Application](./xdebug-phpstorm-8.png)

  Set up a configuration for `TEST_SERVER` created earlier. I have named it to `TEST_CHROME`.

  ![PhpStorm PHP Servers - New Configuration](./xdebug-phpstorm-9.png)

  Choose the created server and appropriate browser available from the options. Also, you can see the url that will open in the browser.

  Click on `OK` to save this.

- Now, open the project in [PhpStorm](https://www.jetbrains.com/phpstorm/).
- Set a breakpoint where you want to check your logic. To set a breakpoint, just click on the left side of the line of code. Click on the position of red round mark. Click on th same position to remove the breakpoint.

  ![PhpStorm PHP Servers - PhpStorm Breakpoint](./xdebug-phpstorm-10.png)

- Now open the link in your browser in debugging mode by navigating `Run > Debug 'TEST_CHROME'`. The browser may ask you to install a [JetBrains Extension (in Chrome)](https://chrome.google.com/webstore/detail/jetbrains-ide-support/hmhgeddbohgjknpmjagkdomcpobmllji) in your browser.
- You will see a webpage opening in the browser you set in configuration. Navigate to the point where you want to check your logic. When you reach to the breakpoint, the browser will keep itself in the loading position. In the mean time, you will see [PhpStorm](https://www.jetbrains.com/phpstorm/) being highlighted in taskbar or focused on top with the breakpoint highlighted with different color as shown below:

  ![PhpStorm PHP Servers - PhpStorm Highlighted Breakpoint](./xdebug-phpstorm-11.png)

  You can see the debugging window right at the bottom part of [PhpStorm](https://www.jetbrains.com/phpstorm/) window. You can find `Step Over`, `Step Into`, `Step Out`, `Watch` etc. controls in the Debugging Window.

See the shortcuts or set up your own shortcuts, they will help you a lot.

Hope you will feel ease to find any logical mistakes in your PHP code by debugging using [Xdebug](https://xdebug.org/) in [PhpStorm](https://www.jetbrains.com/phpstorm/).
