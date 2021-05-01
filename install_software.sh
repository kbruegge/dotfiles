
echo "Installing essential packages."
for pkg in watch tree pandoc openssl cmake coreutils readline iterm2 sqlite3 xz zlib python zsh wget htop tmux gcc hdf5 neovim ocrmypdf pyenv ruby imagemagick; do
    if brew ls --versions "$pkg" > /dev/null; then
        echo "Package '$pkg' is already installed"
    else
        echo "Package '$pkg' is not installed. Installing"
        brew install $pkg
    fi
done

AUTOLOAD_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
if [ ! -d $AUTOLOAD_PATH ]; then
    echo "Installing Neovim Plugin Manager"
    curl -fLo $AUTOLOAD_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing Fonts"
brew tap homebrew/cask-fonts   
for pkg in font-office-code-pro font-fira-code font-hack font-fira-sans font-gentium-book-basic font-hack-nerd-font; do
    if brew ls --versions "$pkg" > /dev/null; then
        echo "Package '$pkg' is already installed"
    else
        echo "Package '$pkg' is not installed. Installing"
        brew install $pkg
    fi
done

# font used for my dissertation
if [ ! -f "$HOME/Library/Fonts/MinionPro-Bold.otf" ]; then
  echo "Minion Font"
  wget https://www.wfonts.com/download/data/2016/05/26/minion-pro/minion-pro.zip
  unzip "minion-pro.zip" -d $HOME/Library/Fonts/
  rm "minion-pro.zip"
else
  echo "Minion Font seems to be installed already"
fi



if [ ! -d "/Library/TeX/texbin/" ]; then

    echo "Do you wish to install MacTex 2019? This requires a large download (y\n)?"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        echo "installing mactex using brew"
        brew install mactex-no-gui
    else
        echo "Skipping Latex Installation"
    fi

else
    echo "mactex seems to be installed already"
fi

if [ ! -d "/Applications/Spotify.app" ]; then
    echo "installing spotify using brew"
    brew install spotify
else
    echo "spotify seems to be installed already"
fi


if [ ! -d "/Applications/Firefox.app" ]; then
    echo "installing firefox using brew"
    brew install firefox
else
    echo "firefox seems to be installed already"
fi

if [ ! -d "/Applications/Visual Studio Code.app" ]; then
    echo "installing vscode using brew"
    brew install visual-studio-code
else
    echo "vscode seems to be installed already"
fi



echo 'Installing essential python packages into root environment'
pip freeze > /tmp/piplist_temp.txt
while read p; do
    if ! grep -wqi $p /tmp/piplist_temp.txt
    then
        pip install "$p"
    else
        echo $p already installed
    fi
done < pip_packages.txt
rm /tmp/piplist_temp.txt

if  xattr "/Applications/Visual Studio Code.app" | grep quarantine ; then
    echo "adding gatekeeper exception for VS Code"
    sudo xattr -r -d com.apple.quarantine "/Applications/Visual Studio Code.app"
fi

export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
echo "Installing vscode extensions"
while read p; do
  code --install-extension "$p"
done < vscode/extensions.txt

echo "Installing poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -


if [ ! -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    echo "Installing sdkman"
    curl -s "https://get.sdkman.io" | bash 
else
    echo "sdkman seems to be installed already"
fi

gem install iStats
gem install colorls
mkdir -p "$HOME/.config/colorls/"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:/usr/local/lib/ruby/gems/3.0.0/bin"

source $(dirname $(gem which colorls))/tab_complete.sh


