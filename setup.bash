#!/bin/bash
EXECUTION_DIR="$(pwd)"
BASE_SCRIPT_DIR="$(dirname $(realpath $0))"

FINAL_DOTFILES_DIR="$HOME/.config/dotfiles"

# Link the dotfiles folder to .config path if the link does not exist
if [ ! -L "$FINAL_DOTFILES_DIR" ]; then
    ln -sf "$BASE_SCRIPT_DIR" "$FINAL_DOTFILES_DIR"
    echo "Dotfiles symlink created."
fi

# Find directories without a dot in their names and read them into a while loop
find -L "$BASE_SCRIPT_DIR" -maxdepth 1 -type d -not -path "$BASE_SCRIPT_DIR" -not -path "*.*" -not -name ".*" -print0 | while IFS= read -r -d '' dir; do
    # If install.bash exists in the directory, execute it
    if [ -f "${dir}/install/install.bash" ]; then
        source "${dir}/install/install.bash" "$FINAL_DOTFILES_DIR"
    fi
done
