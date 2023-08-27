#!/usr/bin/env bash

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install_package() {
	if ! command_exists "$1"; then
		sudo dnf install "$1" -y
	fi
}

clone_repo() {
	if ! test -d "$HOME/git/dots/"; then
		mkdir -p "$HOME/git"
		git clone https://github.com/jeircul/dots "$HOME/git/dots"
	fi
}

main() {
	install_package git
	install_package ansible
	install_package gh
	clone_repo
	ansible-playbook "$HOME/git/.config/autoinstall/configure_fedora_qtile.yml" -K
}

main
