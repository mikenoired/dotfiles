#!/usr/bin/env bash

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install gnu-sed --with-default-names
echo "✅ Installed gnu-sed"

brew install wget --with-iri
echo "✅ Installed wget"

PACKAGES=("findutils" "moreutils" "coreutils" "neovim" "grep" "openssh" "pnpm" "python", "starship" "youtube-dl" "node" "mongosh" "fortune" "bun" "cowsay" "zsh" "nvm" "tree" "lolcat")
for package in "${PACKAGES[@]}"; do
  brew install "$package"
  echo "✅ Installed $package"
done

CASKS=("raycast" "telegram" "arc" "discord" "obs" "whisky" "visual-studio-code" "iterm2" "notion" "fork" "keka" "whisky" "vlc")
for package in "${PACKAGES[@]}"; do
  brew install --cask "$package"
  echo "✅ Installed $package"
done

brew cleanup