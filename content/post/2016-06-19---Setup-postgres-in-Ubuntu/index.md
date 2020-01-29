---
title: Setup postgresql in Ubuntu
date: '2016-06-19T00:00:00Z'
draft: false
slug: 'setup-postgresql-in-ubuntu'
categories: ['Tech', 'Development']
tags: ['postgres', 'ubuntu']
description: 'Install PostgreSQL and know about first time setup including user management.'
---

<a href="https://www.postgresql.org/" target="_blank">PostgreSQL</a> is a powerful, open source object-relational database system.

### Install PostgreSQL

#### 1. From PPA (Recommended)

- Create a file `/etc/apt/sources.list.d/pgdg.list`, and add following line for the repository

```bash
# for ubuntu 16.04 users
deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main

# for ubuntu 15.10 users
deb http://apt.postgresql.org/pub/repos/apt/ wily-pgdg main

# for ubuntu 14.04 users
deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main

# for ubuntu 12.04 users
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
```

- Import the repository signing key, and update the package lists

```bash
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -
$ sudo apt-get update
```

- Install postgreSQL and, check version

```bash
$ sudo apt-get install postgresql-9.5
$ psql --version
```

#### 2. From native store

Enter following commands:

```bash
$ sudo apt-get update
$ sudo apt-get install postgresql-9.4
$ psql --version
```

### First time setup

- Connect to the default database with user <strong>postgres</strong>:

```bash
$ sudo -u postgres psql template1
```

- Set the password for user <strong>postgres</strong>, then exit psql (Ctrl+D):

```sql
ALTER USER postgres with encrypted password 'xxxxxxxx';
```

- Edit the `pg_hba.conf` file. And, change 'peer' to 'md5' on the line concerning postgres:

```bash
$ sudo vim /etc/postgresql/9.5/main/pg_hba.conf
```

&nbsp;&nbsp;&nbsp;&nbsp;Before changes:

```vim
local   all     postgres    peer
```

&nbsp;&nbsp;&nbsp;&nbsp;After changes:

```vim
local   all     postgres    md5
```

- Restart the database:

```bash
$ sudo service postgresql restart
```

- You can check the password with `psql -U postgres`

- Create a user (with superuser access):

```bash
$ createuser -U postgres -d -e -E -l -P -r -s <new_username>
```

- Again edit `pg_hba.conf` file, and change 'peer' to 'md5' on the line concerning 'all' other users:

&nbsp;&nbsp;&nbsp;&nbsp;Before changes:

```vim
local   all     all     peer
```

&nbsp;&nbsp;&nbsp;&nbsp;After changes:

```vim
local   all     all     md5
```

- Restart, and check that you can login with new user

```bash
$ psql -U <new_username> template1
```

#### To access with you as a user

- Create user with your username(can be found by `whoami`):

```bash
$ createuser -U postgres -d -e -E -l -P -r -s <my_name>
```

- Restart postgresql server and check that you can login without `-U postgres`:

```bash
$ psql template1
```

- You can create database easily now:

```bash
$ createdb <db_name>
```

### Resources

- <a href="https://www.postgresql.org/download/linux/ubuntu/" target="_blank">https://www.postgresql.org/download/linux/ubuntu/</a>
- <a href="http://stackoverflow.com/questions/1471571/how-to-configure-postgresql-for-the-first-time" target="_blank">http://stackoverflow.com/questions/1471571/how-to-configure-postgresql-for-the-first-time</a>
