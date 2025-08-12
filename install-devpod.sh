#!/usr/bin/env bash

set -o pipefail -o errtrace -o errexit -o nounset

[[ -n "${TRACE:-}" ]] && set -o xtrace

declare errmsg="ERROR (${0##*/})":
trap 'echo >&2 $errmsg trap on error \(rc=${PIPESTATUS[@]}\) near line $LINENO' ERR

[[ -f ~/.tmux.conf ]] || ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
[[ -f ~/.gitconfig ]] || ln -s "$(pwd)/gitconfig" ~/.gitconfig

user_pw=$(cat ~/.config/devbox/${DEVPOD_WORKSPACE_UID}/$(whoami)_pw)
echo "${user_pw}" | sudo -S apt-get update

sudo apt-get install -y \
  htop \
  flake8 \
  silversearcher-ag \
  tmux \
  tree \
  --no-install-recommends

sudo rm -rf /var/lib/apt/lists/*

echo "Complete!"