#!/usr/bin/env bash

# Run install.sh
# curl -sL https://raw.githubusercontent.com/jeircul/dots/main/install.sh | bash

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
		curl -sOL https://raw.githubusercontent.com/jeircul/dots/main/configure_fedora_qtile.yml --output-dir "$PLAYBOOK_PATH/configure_fedora_qtile/yml"
	fi
}

main() {
	install_package ansible
	install_package gh
	download_playbook
	ansible-playbook "$HOME/.config/ansible/playbooks/configure_fedora_qtile.yml" -K
}

main
