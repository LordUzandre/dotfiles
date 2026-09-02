# Universal aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias baba='source ~/.bashrc'
alias zaza='source ~/.zshrc'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../../'
alias fire='firefox & disown'

alias lz='lazygit'
alias nv='nvim'

# .dot-files config
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# i3lock in tiling mode
# alias ilock='i3lock -c 000000'
alias ilock='i3lock -i $HOME/dotfiles/img/bliss_nighttime_2k.png -t'

# --- LIU-specific ---

# Getlab (UPP)
alias getlab='~/dev/upp/getlab-cli/staff_cli.py'
alias ven='source ~/dev/upp/getlab-cli/venv/bin/activate'
alias a='./a.out'
alias openvpn='sudo openfortivpn remote.edu.liu.se --saml-login'

# C++17-compile
alias w++17='g++ -std=c++17 -Wall -Wextra -Wpedantic'
alias wl++17='clang++ -std=c++17 -Wall -Wextra -Wpedantic'
alias c++17='g++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++'
alias cl++17='clang++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++'

# C++20 aliases
alias w++20='g++ -std=c++20 -Wall -Wextra -Wpedantic'
alias wl++20='clang++ -std=c++20 -Wall -Wextra -Wpedantic'
alias c++20='g++ -std=c++20 -Wall -Wextra -Wpedantic -Weffc++'
alias cl++20='g++ -std=c++20 -Wall -Wextra -Wpedantic -Weffc++'

# TDIU16
alias g++99='gcc -m32 -Wall -Wextra -std=c99 -pedantic -g'
export PATH=$PATH:$HOME/dev/tdiu16/src/utils

#TDDD12
alias my12='echo PLF2kfNdPp | xclip -selection clipboard | mysql -h mariadb.edu.liu.se -u joaen574 -p joaen574'

# ---
# Switch monitor layout on LiU computers
# xrandr output DP-1 pos 0 0

# Switch monitor layout on Linux HDD
# swaymsg output DP-1 pos 0 0

# Connect to LiU with openFortiVPN
# sudo openfortivpn remote.edu.liu.se --saml-login
