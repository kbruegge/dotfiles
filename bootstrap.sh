#!/usr/bin/env bash

# Show a funny header.
cat header.txt

if ! brew_loc="$(type -p "brew")" || [[ -z $brew_loc ]]; then
  echo "installing brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -n "Do you wish to zsh and other shell customizations? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    bash shell_setup.sh
else
    echo "Not installing shell custommizations."
fi

echo -n "Do you wish to install Software (CoreUtils, Firefox, Spotify etc...)? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    bash install_software.sh
else
    echo "Not installing Software."
fi


echo "Linking Dotfiles"
bash link_dotfiles.sh

echo -e "\033[93m"
echo "Manual input might be needed. Karabiner sometimes ignores the config. Read https://github.com/gnarf/osx-compose-key"
echo -e "\033[0m"

echo "Do you wish to set macos default settings. (root required) (y/n)?"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    bash ./macos.sh
else
    echo "Not setting MacOS defaults. Your loss.";
fi

echo "Setting permissions for ssh files"
if [ -d "$HOME/.ssh" ] 
then
    chmod 700 ~/.ssh
else
    echo -e "\033[91mError: .ssh directory does not exist. Something went wrong\033[0m"
fi

chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa*
chmod 644 ~/.ssh/id_rsa*.pub

echo -e "\033[92m"
echo "Remember to set chmod 600 ~/.ssh/id_rsa* and chmod 644 ~/.ssh/id_rsa*.pub for each new ssh key"
echo -e "\033[0m"