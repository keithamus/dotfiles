#!/usr/bin/env sh
printf "Enable menu tray icons? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults read com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu"
fi

printf "Tweak Finder defaults? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults write com.apple.finder QLEnableTextSelection -bool true
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  chflags nohidden ~/Library
  killall Finder
fi

printf "Setup 'minimal dark' mode? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults write NSGlobalDomain AppleEnableMenuBarTransparency -int 0
  defaults write NSGlobalDomain AppleInterfaceStyle Dark
  defaults write NSGlobalDomain AppleAquaColorVariant -int 6
  defaults write NSGlobalDomain AppleHighlightColor -string "0.780400 0.815700 0.858800"
  defaults write com.apple.dock no-glass -bool true
  defaults write com.apple.dock autohide-delay -float 1
  defaults write com.apple.dock autohide -int 1
  defaults read com.apple.dock tilesize -int 68
  defaults write com.apple.dock size-immutable -bool YES
  defaults write com.apple.dock mineffect scale
  killall Dock
fi

printf "Speed up animations? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
  defaults write com.apple.dock autohide-time-modifier -float 0.001
  killall Dock
fi

printf "Disable autocorrect? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

printf "Set up Screenshots directory? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  mkdir -p ~/Screen\ Shots
  defaults write com.apple.screencapture location ~/Screen\ Shots
fi

printf "Set up Safari developer tools? (Y/n) "
read -r REPLY
echo
if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
then
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
  defaults write com.apple.appstore ShowDebugMenu -bool true
fi

if ! [ -L ~/Documents ]
then
  printf "Do you want to link ~/Documents and ~/Dropbox? (y/n) "
  read -r REPLY
  echo
  if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]
  then
    echo "› Linking ~/Documents and ~/Dropbox..."
    mv ~/Documents/* ~/Dropbox
    sudo rm -rf ~/Documents
    ln -s ~/Dropbox ~/Documents
  fi
fi

if ! [ -L ~/Desktop ]
then
  printf "Do you want to nuke the desktop and link to ~/Downloads? (y/n) "
  read -r REPLY
  echo
  if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]
  then
    echo "› Linking ~/Desktop and ~/Downloads"
    mv ~/Desktop/* ~/Downloads
    sudo rm -rf ~/Desktop
    ln -s ~/Downloads ~/Desktop
    defaults write com.apple.finder CreateDesktop false;
  fi
fi
