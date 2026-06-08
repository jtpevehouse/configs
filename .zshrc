# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
# End of lines configured by zsh-newuser-install
#
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pevehousejosh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom configs
autoload edit-command-line
zle -N edit-command-line
export EDITOR="nvim"
export VISUAL="nvim"

# Keybindings
bindkey '^f' autosuggest-accept
bindkey '^[e' edit-command-line

# Aliases
alias ll="ls -lha"
alias "git-sub-nuke"="git submodule deinit -f -all"
alias "dot"="/usr/bin/git --git-dir=$HOME/.dot --work-tree=$HOME"

# Functions
# Rebuild submodules in a repo
git_sub_rebuild() {
	if [[ -e "$PWD/.gitmodules" ]]; then
		git submodule deinit -f --all
		git submodule sync --recursive
		git submodule update --init --recursive
	else
		echo "No submodles to rebuild"
	fi
}

update-kitty() {
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
}

# Autosuggestions configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Plugins
source /home/pevehousejosh/.antidote/antidote.zsh

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up   # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
