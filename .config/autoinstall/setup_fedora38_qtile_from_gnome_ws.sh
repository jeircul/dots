#!/usr/bin/env bash

SOFTWARE=(git ansible gh)
DOTFILE_REPO="https://github.com/jeircul/dots"
LOCAL_DOTFILE_PATH="$HOME/git/jeircul/dots/"
ANSIBLE_PLAYBOOK="$HOME/git/jeircul/dots/.config/autoinstall/configure_fedora_qtile.yml"

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

install_package() {
	if ! command_exists "$1"; then
		sudo dnf install "$1" -y
	fi
}

clone_repo() {
	if ! test -d "$LOCAL_DOTFILE_PATH"; then
		mkdir -p "$HOME/git"
		git clone "$DOTFILE_REPO" "$LOCAL_DOTFILE_PATH"
	else
		cd "$LOCAL_DOTFILE_PATH" || return
		git pull
	fi
}

main() {
	for PKG in "${SOFTWARE[@]}"; do
		install_package "$PKG"
	done
	clone_repo
	ansible-playbook "$ANSIBLE_PLAYBOOK" -K
}

main
