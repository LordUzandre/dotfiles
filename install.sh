#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles/dotfiles_backup_$(date +%Y%m%d%_%H%M%S)"

FILES=(
  ".aerospace.toml"
  ".bash_aliases"
  "clang-format"
  "tmux.conf"
  ".vimrc"
  ".zshrc"
)

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  if [ ! -e "$SOURCE" ]; then
    echo "Unable to find $SOURCE in the repo! Skipping it."
    continue
  fi

  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
      echo "$file is already correctly linked."
    fi

    #if file exists but is not our symlink, create backup
    if [ ! -d "$BACKUP_DIR" ]; then
      mkdir -p "$BACKUP_DIR"
    fi

    # Create eventual underlying folders in backup
    mkdir -p "$BACKUP_DIR/$(dirname "$file")"

    echo "backing up existing $file to $BACKUP_DIR/$file"
    mv "$TARGET" "$BACKUP_DIR/$file"
  fi

  # CREATE THE SYMBOLIC LINK
  echo "creating symlink: $TARGET -> $SOURCE"
  ln -s "$SOURCE" "$TARGET"
done
