+++
title='Terminal enhancements'
date='2018-04-20'
slug='terminal-enhancements'
categories=['Linux', 'Terminal']
tags=['arch', 'arch linux', 'linux', 'terminal']
description='Tweaks to make optimum use of terminal in Arch Linux'
+++

### Dropdown terminal

It seems [Guake](http://guake-project.org/) is an obvious choice for everyone, but [Tilix](https://gnunn1.github.io/tilix-web/) gives terminator features of splitting a window with flavor of Guake.

```sh
yaourt -S tilix-bin
```

To use tilix as a dropdown terminal, you need to setup a key with `tilix -q` as action.

### Install zsh

```sh
sudo pacman -S zsh
```

### Install git

```sh
sudo pacman -S git
```

### Setup oh-my-zsh

```sh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
```

### ZSH Theme

I am using a custom theme inspired from [juanghurtado](https://github.com/robbyrussell/oh-my-zsh/wiki/themes#juanghurtado).

```sh
# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Prompt format
PROMPT='
%{$GREEN_BOLD%}%{$YELLOW%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%} %{$GREEN_BOLD%}$(git_current_branch)
%{$BLUE%}>%{$RESET_COLOR%} '
```

![My Custom ZSH Theme](./my-custom-theme.png)

### Reboot or log out - log in

#### References

- [ZSH Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/themes)
- [Getting oh-my-zsh to work in Ubuntu](https://gist.github.com/tsabat/1498393)
