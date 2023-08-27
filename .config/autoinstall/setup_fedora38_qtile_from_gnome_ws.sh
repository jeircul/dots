#!/usr/bin/env bash

# Run script
# curl -sL https://raw.githubusercontent.com/jeircul/dots/main/.config/autoinstall/setup_fedora38_qtile_from_gnome_ws.sh | bash

# Download install.sh
# curl -sOL https://raw.githubusercontent.com/jeircul/dots/main/install.sh

PLAYBOOK_PATH="$HOME/.config/ansible/playbooks"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install_package() {
	if ! command_exists "$1"; then
		sudo dnf install "$1" -y
	fi
}

download_playbook() {
	if ! test -f "$PLAYBOOK_PATH/configure_fedora_qtile.yml"; then
		echo "Ansible playbook does not exists, downloading..."
		curl -sL https://raw.githubusercontent.com/jeircul/dots/main/.config/autoinstall/configure_fedora_qtile.yml --output-dir "$HOME/.config/ansible/playbooks/configure_fedora_qtile/yml"
	fi
}

main() {
	install_package ansible
	install_package gh
	download_playbook
	ansible-playbook "$PLAYBOOK_PATH/configure_fedora_qtile.yml" -K
}

main
