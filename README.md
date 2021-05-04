# Kai's Dotfiles

My dotfiles and some script to help me setup new machines.
A collection of things configs and tweaks I use on a regular basis.
Includes installation and configuration of `zsh` and my MacOS defaults.
Tested on MacOS Catalina.

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
profile for the MacOs terminal and Iterm2.

Also installs: 

 * colorls
 * istats
 * pandoc
 * mactex
 * sdkman


The bootstrap script also copies all dotfiles to the appropriate position. 

If you only want to link the dotfiles call `link_dotfiles.sh`


## Python related things

In case you don't want to use `poetry` for a project, you can use the following commands to handle virtual environments for python.
Create a new Python environment with `jupyter` and `ipython` installed.

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

## Useful Shell functions

Show all unpushed changes in `$HOME/Development`
```
changes
```

Compress one or multiple PDF files

```
pdfcompress *.pdf
```

## Defaults

MacOS Settings:

 1. Three finger Drag
 2. Smaller Dock Icons
 3. Keyboard repeat 
 4. etc.

Tmux:

 1. Use Ctrl-A just like `screen`

VS Code:

 1. Usefull snippets for `main` and `embed`
 2. Some of my regular used VSCode extensions like window color per project and other language related things.

NeoVim:
 1. Replace `vim` with alias to `nvim`
 2. Use Airline Addon
