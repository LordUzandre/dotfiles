#!/bin/bash

# -----
# Colors
# -----

RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'

# -----
# DIRECTORIES
# -----

# Use the scripts location instead of $HOME/dotfiles
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"
BACKUP_DIR="$HOME/dotfiles/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# -----
# FILES
# -----

FILES=(
  ".aerospace.toml"
  ".bash_aliases"
  ".clang-format"
  ".mylogin.cnf"
  ".p10k.zsh"
  ".tmux.conf"
  ".vimrc"
  ".zshrc"
  ".config/i3/config"
  ".config/nvim/lua/plugins/colorscheme.lua"
  ".config/nvim/lua/plugins/themes_list.lua"
  ".config/nvim/lua/config/keymaps.lua"
  ".config/sway/config"
)

# -----

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

# -----
# Add call to bash_aliases in bash/zshrc
# -----

# Fetch name for current shell
CURRENT_SHELL=$(basename "$SHELL")
RC_FILE=""

if [ "$CURRENT_SHELL" = "zsh" ]; then
  RC_FILE="$HOME/.zshrc"
elif [ "$CURRENT_SHELL" = "bash" ]; then
  RC_FILE="$HOME/.bashrc"
fi

if [ -n "$RC_FILE" ] && [ -e "$RC_FILE" ]; then
  # Add check if call to alias exists in rc_file
  if ! grep -q "source ~/.bash_aliases" "$RC_FILE"; then
    echo -e "Adding alias-check to ${YELLOW}$RC_FILE${RESET}"
    cat <<'EOF' >>"$RC_FILE"

# Load in shared aliases
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi
EOF
  else
    echo -e "${GREEN}✔️[OK]${RESET}$CURRENT_SHELL shell already load aliases."
  fi
else
  echo -e "${YELLOW}Unable to add call for alises. ${RESET}Uses other shell than bash or zsh. ($CURRENT_SHELL).${RESET}"
fi

# ==============================================================================
