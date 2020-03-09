# Kai's Dotfiles

My dotfiles and some script to help me setup new machines.
A collection of things configs and tweaks I use on a regular basis.
Includes installation and configuration of `zsh` and my MacOS defaults.
Works on MacOS Mojave and Catalina.

Inspired by several dotfile repositories around the net. First and foremost:
https://github.com/mathiasbynens/dotfiles


## Usage

First, add your gitconfig and ssh config into the corresponding folders.
Then, if you want to execute the whole shebang and setup you're machine just like me simply call 

```
bash bootstrap.sh
```

This will install `brew` and some of the core software I always use e.g. Spotify, Firefox, VS Code, ....
It will prompt for setting all the default MacOS configuration settings in `macos.sh` and install my default terminal 
profile for the MacOs terminal (no iTerm). 
The bootstrap script also copies all dotfiles to the appropriate position. 

If you only want to link the dotfiles call `link_dotfiles.sh`

## Useful Shell functions

Create a new python environment with jupyter and ipython installed.
```
mkenv <name>
```
Equivalently
```
listenv
rmenv <name>
activate <name>
deactivate
```

Show all unpushed changes in `$HOME/Development`
```
changes
```

## Defaults

MacOS Settings:
    1. Three finger Drag
    2. Smaller Dock Icons
    3. Keyboard repeat 
    4. etc..

Tmux:
    1. Use Ctrl-A just like screen

VS Code:
    1. Usefull snippets for `main` and `embed`
    2. Pyhton extension and Window color per project

NeoVim:
    1. Replace `vim` with alias to `nvim`
    2. Use Airline Addon

Karabiner is installed (if prompt is answered) to enable a compose key for US layout keyboard (right option)