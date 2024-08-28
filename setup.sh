#!/usr/bin/env bash

dotfiles_echo() {
  local fmt="$1"
  shift

  # shellcheck disable=SC2059
  printf "\\n[DOTFILES] ${fmt}\\n" "$@"
}

if [ "$osname" != "Darwin" ]; then
  dotfiles_echo "Oops, it looks like you're using a non-Apple system. Sorry, this script only supports macOS. Exiting..."
  exit 1
fi

export DOTFILES="${HOME}/dotfiles"

dotfiles_echo "Installing dotfiles..."
dotfiles_echo "Setting up dotfiles..."

# Symlinks
ln -s "$DOTFILES/zsh/.zshrc" ~/.zshrc # Zsh
ln -s "$DOTFILES/nvim" ~/.config/nvim # Neovim
ln -s "$DOTFILES/starship.toml" ~/.config/starship.toml # Starship
ln -s "$DOTFILES/.bash_profile "~/.bash_profile # Bash
ln -s "$DOTFILES/zed/settings.json" ~/.config/zed/settings.json # Zed

dotfiles_echo "Setting up brew..."

# Setup brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
./brew

dotfiles_echo "Set zsh as default shell..."

# Set zsh as default
chsh -s $(which zsh)

dotfiles_echo "Setting up oh-my-zsh..."

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dotfiles_echo "Setting up zsh plugins..."

# Setup zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

dotfiles_echo "Setting up iterm2..."

# Setup iterm2 settings
if [ -d "/Applications/iTerm.app" ]; then
  dotfiles_echo "Setting up iTerm2 preferences..."

  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES/iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi

dotfiles_echo "Dotfiles setup complete!"
