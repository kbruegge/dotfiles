#!/usr/bin/env bash

# ~/.macos — adapted from  https://mths.be/macos


function set_profile {
    echo "Setting default terminal profile"
	sudo xattr -r -d com.apple.quarantine ./kais_terminal_profile.terminal
    open "./kais_terminal_profile.terminal"
}

echo -n "Do you wish to set the terminal profile? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    set_profile
else
    echo "Not setting profile"
fi


# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# reasonable trackpad settings
defaults write com.apple.trackpad scaling 1.6
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag  -int 1

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# keyboard repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

defaults write com.apple.dock tilesize -int 46
# Dock magnification
defaults write com.apple.dock magnification -bool true
# Icon size of magnified Dock items
defaults write com.apple.dock largesize -int 66

# see discussion https://github.com/Microsoft/vscode/issues/51132
# OS_VERSION=`sw_vers -productVersion`
# if (( "${OS_VERSION:3:2}" >= 14 )); then
#  	echo "Overwriting font defaults"
# # # 	# defaults write com.microsoft.VSCode.helper CGFontRenderingFontSmoothingDisabled -bool NO
#  fi