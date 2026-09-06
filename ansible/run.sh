#!/bin/bash

# -----
# Ansible Setup
# -----

# Exit immediately if a command fails
set -e

# Find the directory where this script is located. 
# This allows the script to be executed from anywhere. 
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# -----
# Install Ansible
# -----

if command -v ansible-playbook >/dev/null 2>&1; then 
	echo "Ansible is already installed." 
else 
	echo "Ansible is not installed. Installing it..." 

	# Determine the Linux distribution. 
	source /etc/os-release 
	case "$ID" in 
		ubuntu|debian) 
		# Debian and Ubuntu use APT. 
		sudo apt update
		sudo apt install -y ansible git
		;;
		fedora) 
			# Fedora uses DNF. 
			sudo dnf install -y ansible git
			;;

		arch) 
			# Arch uses pacman. 
			sudo pacman -Sy --needed --noconfirm ansible git
			;;
		*) 
			echo "ERROR: Unsupported distribution: $ID"
			exit 1
			;;
	esac
fi

echo
echo "Starting Ansible configuration..."
echo

# Run the workstation playbook. 
# -K asks for the sudo password
ansible-playbook -i "$SCRIPT_DIR/inventory/localhost.yml" "$SCRIPT_DIR/playbook.yml" -K
