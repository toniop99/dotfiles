#!/bin/bash

DOTFILES_DIR=$1

# Install alacritty config
if command -v nvim &>/dev/null; then
  configSource=$DOTFILES_DIR"/nvim"
  configDestination="$HOME/.config/nvim"

  # if in config source exists nvim folder move it to nvim.bak and if nvim.bak exists add a number to it
  if [ -d "$configDestination" ]; then
    if [ -d "$configDestination.bak" ]; then
      i=1
      while [ -d "$configDestination.bak.$i" ]; do
        i=$((i + 1))
      done
      mv "$configDestination" "$configDestination.bak.$i"
    else
      mv "$configDestination" "$configDestination.bak"
    fi
  fi

  # Create a symbolic link from the source to the destination
  ln -sf "$configSource" "$configDestination"

  echo "nvim config symlink created."
else
  echo "nvim is not installed. Install it before running this script."
fi
