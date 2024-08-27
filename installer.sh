#!/usr/bin/env bash

set -euo pipefail

echo "🛠️ Installing dotfiles..."
echo "-------------------------------------------------"
echo
export DOTFILES_PATH="$HOME/dotfiles"
echo "👉 Cloning into: '$DOTFILES_PATH'"

git --version

git clone --depth 1 git@github.com:mikenoired/dotfiles.git "$DOTFILES_PATH"