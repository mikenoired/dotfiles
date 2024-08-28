#!/usr/bin/env bash

set -euo pipefail

echo "🛠️ Installing dotfiles..."
echo "-------------------------------------------------"
echo
export DOTFILES_PATH="$HOME/dotfiles"
echo "👉 Cloning into: '$DOTFILES_PATH'"

echo "Check for having 'git' in your system..."

which git &> /dev/null
if [ $? -eq 0 ]; then
  echo "Git is installed. Installing dotfiles..."
  git clone --depth 1 git@github.com:mikenoired/dotfiles.git "$DOTFILES_PATH"
else
  echo "Error: Git is not installed. Please install it before proceeding or run 'git --version' for git activation."
  exit 1
fi
