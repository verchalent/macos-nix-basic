#!/usr/bin/env bash

# Script to change additional MacOS and app settings outside of nix

##########################
# Desktop and Dock Settings
##########################

# Disable Click Wallpaper to reveal desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

##########################
# Notification Settings
##########################

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null #need to test this



##########################
# Default App Settings
##########################


##########################
# Keyboard shortcut Changes
##########################


##########################
# Raycast Settings
##########################

# turn off game mode