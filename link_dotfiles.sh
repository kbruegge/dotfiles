#!/usr/bin/env bash

echo 'Setting up Symlinks.'
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip
ln -sf "$(pwd)/git/gitignore_global" ~/.gitignore_global
ln -sf "$(pwd)/git/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/zsh/zshrc" ~/.zshrc

mkdir -p ~/.config/nvim/
ln -sf "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim

echo "Installing Neovim Plugin Manager"
nvim --headless +PlugInstall +qa



CODE_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p  $CODE_SETTINGS_DIR
ln -sf "$(pwd)/vscode/settings.json" "$CODE_SETTINGS_DIR/settings.json"


CODE_SNIPPETS_DIR="$HOME/Library/Application Support/Code/User/snippets"
mkdir -p  $CODE_SNIPPETS_DIR
ln -sf "$(pwd)/vscode/snippets/python.json" "$CODE_SNIPPETS_DIR/python.json"


if [ -d "/Applications/Karabiner-Elements.app" ]; then
    if  xattr "/Applications/Karabiner-Elements.app" | grep quarantine ; then
        echo "adding gatekeeper exception for karabiner"
        sudo xattr -r -d com.apple.quarantine "/Applications/Karabiner-Elements.app"
    fi
    echo "Setting up karabiner for compose key."
    mkdir -p ~/Library/KeyBindings
    mkdir -p ~/.karabiner.d/configuration
    ln -sf "$(pwd)/karabiner/DefaultKeyBinding.dict" ~/Library/KeyBindings/DefaultKeyBinding.dict
    ln -sf "$(pwd)/karabiner/karabiner.json" ~/.karabiner.d/configuration/karabiner.json
else
    echo "No Karabiner installation found. Not setting up Karabiner settings."
fi