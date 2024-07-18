#!/bin/bash

DOTFILES_DIR=$1

# Install alacritty config
if command -v alacritty &>/dev/null; then
  alacrittyConfigSource=$DOTFILES_DIR"/alacritty"
  alacrittyConfigDestination="$HOME/.config/alacritty"

  # Create a symbolic link from the source to the destination
  ln -sf "$alacrittyConfigSource" "$alacrittyConfigDestination"

  echo "Alacritty config symlink created."
else
  echo "Alacritty is not installed. Install it before running this script."
fi
