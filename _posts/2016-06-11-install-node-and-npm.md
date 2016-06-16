---
layout:     post
title:      Install node and npm
date:       2016-06-10
summary:    Install node and npm in Windows/Linux/Mac
categories: install node nodejs node.js npm linux windows mac setup
---

<a href="https://nodejs.org/" target="_blank">Node.js</a> is a JavaScript runtime built on Chrome's V8 JavaScript engine. <a href="https://nodejs.org/" target="_blank">Node.js</a> uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. <a href="https://nodejs.org/" target="_blank">Node.js</a>' package ecosystem, <a href="https://www.npmjs.com/" target="_blank">npm</a>, is the largest ecosystem of open source libraries in the world.

<a href="https://www.npmjs.com/" target="_blank">Npm</a> is a package manager for JavaScript. Use <a href="https://www.npmjs.com/" target="_blank">npm</a> to install, share, and distribute code; manage dependencies in your projects; and share & receive feedback with others.

## Install node

### For Windows and Mac users

The installer  can be downloaded from <a href="https://nodejs.org/en/download/" target="_blank">here</a>.

### For Linux users,

There are following ways available to install <a href="https://nodejs.org/" target="_blank">Node.js</a>:

#### 1. From PPA (Recommended)

<a href="https://nodejs.org/" target="_blank">Node.js</a> is available from the NodeSource Debian and Ubuntu binary distributions repository (formerly Chris Lea's Launchpad PPA). Support for this repository, along with its scripts, can be found on GitHub at <a href="https://github.com/nodesource/distributions" target="_blank">nodesource/distributions</a>.

Open your terminal (Ctrl + Alt + T) and enter:

{% highlight bash %}
#for Node-4.x
$ curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
$ sudo apt-get install -y nodejs

#For Node-6.x
$ curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
$ sudo apt-get install -y nodejs
{% endhighlight %}

#### 2. From Node Package Manager(npm)

Latest and stable, both versions of Node are available. 
Follow these steps to install node:

1. Install <a href="https://www.npmjs.com/" target="_blank">npm</a>. If you have already installed it, skip to step 3.
2. To install <a href="https://www.npmjs.com/" target="_blank">npm</a>, find the instructions <a href="{{site.baseurl}}/install/npm/linux/ubuntu/windows/setup/2016/06/10/install-npm/" target="\_blank">here</a>.
3. Enter the following commands in terminal to install/upgrade latest stable version <a href="https://nodejs.org/" target="_blank">Node.js</a>:

{% highlight shell %}
$ sudo npm cache clean -f
$ sudo npm install -g n
$ sudo n stable
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The `n` package represents a Node helper.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Any specific version can be installed by:

{% highlight shell %}
$ sudo n 6.2.1
{% endhighlight %}

#### 3. From native Software Center

A stable version of node is available built at the time of release of your current OS.

To install, open terminal (Ctrl + Alt + T) and enter:

{% highlight bash %}
# for ubuntu user
$ sudo apt-get install nodejs
{% endhighlight %}


Once, any of the above step is completed, you can confirm the installation by:
{% highlight shell %}
$ node -v
v6.2.1
{% endhighlight %}

## Install npm

### For Windows and Macintosh users

<a href="https://www.npmjs.com/" target="_blank">Npm</a> comes along with <a href="https://nodejs.org/" target="_blank">node.js</a> installer which can be found <a href="https://nodejs.org/en/download/" target="_blank">here</a>.

### For Linux users

<a href="https://www.npmjs.com/" target="_blank">Npm</a> is available in native software center
{% highlight bash %}
# for ubuntu users
$ sudo apt-get install npm
{% endhighlight %}

Check the version of npm by:
{% highlight bash %}
$ npm --version
3.9.3
{% endhighlight %}

#### Resources
* <a href="https://nodejs.org/en/" target="_blank">https://nodejs.org/en/</a>
* <a href="https://nodejs.org/en/download/package-manager/" target="_blank">https://nodejs.org/en/download/package-manager/</a>
