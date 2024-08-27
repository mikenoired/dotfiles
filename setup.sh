#!/usr/bin/env bash

# Symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc # Zsh
ln -s ~/dotfiles/nvim ~/.config/nvim # Neovim
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml # Starship
ln -s ~/dotfiles/.bash_profile ~/.bash_profile # Bash

# Setup brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
./brew

# Set zsh as default
chsh -s $(which zsh)

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions