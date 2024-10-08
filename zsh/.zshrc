export PATH=$HOME/bin:/usr/local/bin:$PATH
export DOTFILES="$HOME/dotfiles"
export ZSHDIR="$DOTFILES/zsh"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

export PROMPT='[%1~] %%'

prompt_dir() {
  prompt_segment blue black '%~'
}

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    npm
    macos
    zsh-nvm
)

. $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

. "$ZSHDIR/aliases.zsh"
HOOKS_DIR="$ZSHDIR/functions"
for file in $HOOKS_DIR/*.sh; do
  . "$file"
done

eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export PNPM_HOME="/Users/mikenoired/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

fortune | cowsay -f sheep | lolcat
