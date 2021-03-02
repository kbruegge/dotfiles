#!/usr/bin/env bash

echo 'Setting up Symlinks.'
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip
ln -sf "$(pwd)/git/gitignore_global" ~/.gitignore_global
ln -sf "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/zsh/zshrc" ~/.zshrc

echo "Linking and setting up nvim"
mkdir -p ~/.config/nvim/
ln -sf "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim
nvim --headless +PlugInstall +qa

if [ -f "$(pwd)/ssh/config" ]; then
    echo "Linking ssh config"
    mkdir -p "$HOME/.ssh/"
    ln -sf "$(pwd)/ssh/config" ~/.ssh/config
else
    echo "No ssh config file to link found at $(pwd)/ssh/config"
fi



if [ -f "$(pwd)/git/gitconfig" ]; then
    echo "Linking git config"
    ln -sf "$(pwd)/git/gitconfig" ~/.gitconfig
else
    echo "No ssh config file to link found at $(pwd)/git/gitconfig"
fi



CODE_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p  $CODE_SETTINGS_DIR
ln -sf "$(pwd)/vscode/settings.json" "$CODE_SETTINGS_DIR/settings.json"


CODE_SNIPPETS_DIR="$HOME/Library/Application Support/Code/User/snippets"
mkdir -p  $CODE_SNIPPETS_DIR
ln -sf "$(pwd)/vscode/snippets/python.json" "$CODE_SNIPPETS_DIR/python.json"


