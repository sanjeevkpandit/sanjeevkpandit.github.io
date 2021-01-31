+++
date = '2016-05-24'
title = 'Setup XDebug in Ubuntu'
slug = 'setup-xdebug-in-ubuntu'
tags = ['php', 'xdebug', 'php-xdebug', 'ubuntu', 'linux']
categories = ['Tech', 'Development']
description = 'Debug PHP code using XDebug in Ubuntu'
+++

[Xdebug](https://xdebug.org/)'s basic functions include the display of stack traces on error conditions, maximum nesting level protection and time tracking.

[Xdebug](https://xdebug.org/) is a very powerful tool for finding out the errors and testing the implementation of logics using PHP. You can easily install [Xdebug](https://xdebug.org/) in your machine by following these instructions.

- Always run `sudo apt-get update` before installing any application.

- There are two sources for installation.

  - **Ubuntu**: This will provide you the application compiled during the building of the OS you are using. Thus, you may get older version of the application and might not get updates frequently.
  - **PPA**: You will get the latest version of the application and frequent updates on the application.

- [Optional] Add PPA to your Softwares List. Skip to step #4 if you don't want to use PPA for installation. But, I recommend to use PPA for frequent updates.
  Enter these commands in your terminal.

  ```sh
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get update
  ```

- Enter the following command in your terminal to install [Xdebug](https://xdebug.org/).

  ```sh
  sudo apt-get install php-xdebug
  ```

- After the installation, check the version of xdebug.

  ```sh
  php --version
  PHP 7.0.7-2+donate.sury.org~xenial+1 (cli) ( NTS )
  Copyright (c) 1997-2016 The PHP Group
  Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
      with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
      with Xdebug v2.4.0, Copyright (c) 2002-2016, by Derick Rethans
  ```

  Also, you can find the xdebug configuration file using this command in terminal:

  ```sh
  php --ini | grep xdebug
  /etc/php/7.0/cli/conf.d/20-xdebug.ini,
  ```

  The configuration settings of xdebug can be listed by:

  ```sh
  php -i | grep xdebug
  /etc/php/7.0/cli/conf.d/20-xdebug.ini,
  xdebug
  xdebug support => enabled
  xdebug.auto_trace => Off => Off
  xdebug.cli_color => 0 => 0
  xdebug.collect_assignments => Off => Off
  xdebug.collect_includes => On => On
  xdebug.collect_params => 0 => 0
  xdebug.collect_return => Off => Off
  xdebug.collect_vars => Off => Off
  xdebug.coverage_enable => On => On
  xdebug.default_enable => On => On
  xdebug.dump.COOKIE => no value => no value
  xdebug.dump.ENV => no value => no value
  xdebug.dump.FILES => no value => no value
  xdebug.dump.GET => no value => no value
  xdebug.dump.POST => no value => no value
  xdebug.dump.REQUEST => no value => no value
  xdebug.dump.SERVER => no value => no value
  xdebug.dump.SESSION => no value => no value
  xdebug.dump_globals => On => On
  xdebug.dump_once => On => On
  xdebug.dump_undefined => Off => Off
  xdebug.extended_info => On => On
  xdebug.file_link_format => no value => no value
  xdebug.force_display_errors => Off => Off
  xdebug.force_error_reporting => 0 => 0
  xdebug.halt_level => 0 => 0
  xdebug.idekey => no value => no value
  xdebug.max_nesting_level => 256 => 256
  xdebug.max_stack_frames => -1 => -1
  xdebug.overload_var_dump => On => On
  xdebug.profiler_aggregate => Off => Off
  xdebug.profiler_append => Off => Off
  xdebug.profiler_enable => On => On
  xdebug.profiler_enable_trigger => Off => Off
  xdebug.profiler_enable_trigger_value => no value => no value
  xdebug.profiler_output_dir => /tmp => /tmp
  xdebug.profiler_output_name => cachegrind.out.%p => cachegrind.out.%p
  xdebug.remote_addr_header => no value => no value
  xdebug.remote_autostart => Off => Off
  xdebug.remote_connect_back => Off => Off
  xdebug.remote_cookie_expire_time => 3600 => 3600
  xdebug.remote_enable => On => On
  xdebug.remote_handler => dbgp => dbgp
  xdebug.remote_host => localhost => localhost
  xdebug.remote_log => no value => no value
  xdebug.remote_mode => req => req
  xdebug.remote_port => 9000 => 9000
  xdebug.scream => Off => Off
  xdebug.show_error_trace => Off => Off
  xdebug.show_exception_trace => Off => Off
  xdebug.show_local_vars => Off => Off
  xdebug.show_mem_delta => Off => Off
  xdebug.trace_enable_trigger => Off => Off
  xdebug.trace_enable_trigger_value => no value => no value
  xdebug.trace_format => 0 => 0
  xdebug.trace_options => 0 => 0
  xdebug.trace_output_dir => /tmp => /tmp
  xdebug.trace_output_name => trace.%c => trace.%c
  xdebug.var_display_max_children => 128 => 128
  xdebug.var_display_max_data => 512 => 512
  xdebug.var_display_max_depth => 3 => 3
  ```

  To change the configurations, just change the `ini` file presented in result of above command.

Enjoy debugging with [Xdebug](https://xdebug.org/) in [Ubuntu](http://www.ubuntu.com/).

#### Resources

- [https://xdebug.org/](https://xdebug.org/)
