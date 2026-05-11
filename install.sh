#!/bin/bash

# ==============================================================================
# Colors
# ==============================================================================

RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'

# ==============================================================================

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# ==============================================================================

FILES=(
  ".aerospace.toml"
  ".bash_aliases"
  ".clang-format"
  ".p10k.zsh"
  ".tmux.conf"
  ".vimrc"
  ".zshrc"
  ".config/nvim/lua/plugins/colorscheme.lua"
  ".config/nvim/lua/plugins/themes_list.lua"
  ".config/nvim/lua/config/keymaps.lua"
  ".config/sway/config"
)

# ==============================================================================

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  if [ ! -e "$SOURCE" ]; then
    echo -e "${RED}ERROR:${RESET} Unable to find file ${RED}$SOURCE${RESET} in the repo! Skipping it."
    continue
  fi

  TARGET_DIR=$(dirname "$TARGET")
  if [ ! -d "$TARGET_DIR" ]; then
    echo -e "📁 Skapar katalog: $TARGET_DIR${RESET}"
    mkdir -p "$TARGET_DIR"
  fi

  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
      echo -e "${GREEN}$file ${RESET}is already correctly linked."
      continue
    fi

    # if file exists but is not our symlink, create backup
    if [ ! -d "$BACKUP_DIR" ]; then
      mkdir -p "$BACKUP_DIR"
    fi

    # Create eventual underlying folders in backup
    mkdir -p "$BACKUP_DIR/$(dirname "$file")"

    echo -e " backing up existing ${YELLOW}$file ${RESET}to $BACKUP_DIR/$file"
    mv "$TARGET" "$BACKUP_DIR/$file"
  fi

  # CREATE THE SYMBOLIC LINK
  echo -e " creating symlink between: ${MAGENTA}$TARGET ${RESET}-> ${CYAN}$SOURCE ${RESET}"
  ln -s "$SOURCE" "$TARGET"
done

# ==============================================================================
