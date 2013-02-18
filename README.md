# .dotfiles

These are my .dotfiles. I'm using them on Linux (Ubuntu, Gentoo) and OS X. 

This is inspired by [Robb's .dotfiles](https://github.com/robb/.dotfiles).

## Prerequisites
1. git > 1.7.10
2. zsh > 4.3.9
3. OS X: My terminal settings found in `osx/twam.terminal`

## Installation

1. Clone it into `~`.
2. Make sure you have the submodules by running `git submodule update --recursive --init`.
3. Run `install.sh`.

## Configuration

1. Put your private git settings into `~/.dotfiles/secret/.gitconfig`. This should look like:

```
[user]
  name  = Marty McFly
  email = mmcfly@hillvalley.edu
```
2. Other stuff, like paths etc. can be set in *.zsh files in the local folder.
