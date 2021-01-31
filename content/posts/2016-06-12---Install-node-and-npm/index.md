+++
date = '2016-06-12'
title = 'Install node and npm'
slug = 'install-node-and-npm'
tags = ['node', 'nodejs', 'npm']
categories = ['Tech', 'Development']
description = 'Install node and npm in Windows/Linux/Mac'
+++

[Node.js](https://nodejs.org/) is a JavaScript runtime built on Chrome's V8 JavaScript engine. [Node.js](https://nodejs.org/) uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. [Node.js](https://nodejs.org/)'s package ecosystem, [NPM](https://www.npmjs.com/), is the largest ecosystem of open source libraries in the world.

[NPM](https://www.npmjs.com/) is a package manager for JavaScript. Use [NPM](https://www.npmjs.com/) to install, share, and distribute code; manage dependencies in your projects; and share & receive feedback with others.

## Install node

### For Windows and Mac users

The installer can be downloaded from [here](https://nodejs.org/en/download/).

### For Linux users

There are following ways available to install [Node.js](https://nodejs.org/):

#### 1. From PPA (Recommended)

[Node.js](https://nodejs.org/) is available from the NodeSource Debian and Ubuntu binary distributions repository (formerly Chris Lea's Launchpad PPA). Support for this repository, along with its scripts, can be found on GitHub at [nodesource/distributions](https://github.com/nodesource/distributions).

Open your terminal (Ctrl + Alt + T) and enter:

```sh
#for Node-4.x
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

#For Node-6.x
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### 2. From Node Package Manager(npm)

Latest and stable, both versions of Node are available.
Follow these steps to install node:

1. Install [NPM](https://www.npmjs.com/). If you have already installed it, skip to step 3.
2. To install [NPM](https://www.npmjs.com/), find the instructions [here](https://www.npmjs.com/get-npm).
3. Enter the following commands in terminal to install/upgrade latest stable version [Node.js](https://nodejs.org/):

    ```sh
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
    ```

    The `n` package represents a Node helper.

    Any specific version can be installed by:

    ```sh
    sudo n 6.2.1
    ```

#### 3. From native Software Center

A stable version of node is available built at the time of release of your current OS.

To install, open terminal (Ctrl + Alt + T) and enter:

```sh
# for ubuntu user
sudo apt-get install nodejs
```

Once, any of the above step is completed, you can confirm the installation by:

```sh
node -v
v6.2.1
```

## Install npm

### For Windows and Macintosh users

[NPM](https://www.npmjs.com/) comes along with [Node.js](https://nodejs.org/) installer which can be found [here](https://nodejs.org/en/download/).

### For Linux users

[NPM](https://www.npmjs.com/) is available in native software center

```sh
# for ubuntu users
sudo apt-get install npm
```

Check the version of npm by:

```sh
npm --version
3.9.3
```

#### Resources

- [https://nodejs.org/en/](https://nodejs.org/)
- [https://nodejs.org/en/download/package-manager/](https://nodejs.org/en/download/package-manager/)
