mkdir -p ~/Library/KeyBindings
cp ./DefaultKeyBinding.dict  ~/Library/KeyBindings/DefaultKeyBinding.dict

if brew cask ls --versions karabiner-elements > /dev/null; then
  # The package is installed
  echo "Karabiner already installed"
else
  brew cask install karabiner-elements
fi
mkdir -p ~/.karabiner.d/configuration
cp ./karabiner.json  ~/.karabiner.d/configuration/karabiner.json

mkdir -p ~/Library/KeyBindings
cp ./DefaultKeyBinding.dict  ~/Library/KeyBindings/DefaultKeyBinding.dict

#echo "Manual input needed. Open Karabiner. Read https://github.com/gnarf/osx-compose-key"
