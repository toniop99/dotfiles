#!/bin/bash
EXECUTION_DIR="$(pwd)"
SCRIPT_DIR="$(dirname $(realpath $0))"

destination="$HOME/.config/dotfiles"

# Link the dotfiles folder to .config path
ln -sf $SCRIPT_DIR $destination

# Install alacritty config
if command -v alacritty &>/dev/null; then
  alacrittyConfigSource=$destination"/alacritty"
  alacrittyConfigDestination="$HOME/.config/alacritty"

  # Create a symbolic link from the source to the destination
  ln -sf $alacrittyConfigSource $alacrittyConfigDestination

  echo "Alacritty config symlink created."
else
  echo "Alacritty is not installed. Install it before running this script."
fi
