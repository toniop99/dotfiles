#!/bin/bash

DOTFILES_DIR=$1

if command -v zsh &>/dev/null; then
  configSource=$DOTFILES_DIR"/zsh"
  configDestination="$HOME/.zshrc"

  # Create a symbolic link from the source, .zshrc to the destination
  ln -sf "$configSource/.zshrc" "$configDestination"

  echo "zsh config symlink created."
else
  echo "zsh is not installed. Install it before running this script."
fi
