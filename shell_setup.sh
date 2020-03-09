#!/usr/bin/env bash

echo "Installing zsh, oh-my-zsh, and the spaceship prompt"
if brew ls --versions zsh > /dev/null; then
    echo "Package 'zsh' is already installed"
else
    echo "Package 'zsh' is not installed. Installing"
    brew install zsh
fi


if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "installing oh my zsh"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "oh my zsh seems to be installed already"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" ]; then
  echo "Installing spaceship prompt"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"
  ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
else
  echo "spaceship already installed"
fi