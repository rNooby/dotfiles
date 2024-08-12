#!/usr/bin/env zsh

ZSH_CONFIG_HOME="${ZDOTDIR:-${HOME}/.config/zsh}"
ZSH_ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[[ -r "${ZSH_CONFIG_HOME}/.p10k-instant-prompt-${(%):-%n}.zsh" ]] && source "${ZSH_CONFIG_HOME}/.p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "${ZSH_CONFIG_HOME}/.p10k.zsh" ]] && source "${ZSH_CONFIG_HOME}/.p10k.zsh"

[[ ! -d "${ZSH_ZINIT_HOME}" ]] && mkdir -p "$(dirname "${ZSH_ZINIT_HOME}")"
[[ ! -d "${ZSH_ZINIT_HOME}/.git" ]] && git clone "https://github.com/zdharma-continuum/zinit.git" "${ZSH_ZINIT_HOME}"
[[ -r "${ZSH_ZINIT_HOME}/zinit.zsh" ]] && source "${ZSH_ZINIT_HOME}/zinit.zsh"

[[ -r "${ZSH_CONFIG_HOME}/.zaliases" ]] && source "${ZSH_CONFIG_HOME}/.zaliases"
[[ -r "${ZSH_CONFIG_HOME}/.zfunctions" ]] && source "${ZSH_CONFIG_HOME}/.zfunctions"

zinit ice "depth=1"; zinit light "romkatv/powerlevel10k"

zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "zsh-users/zsh-history-substring-search"

zinit light "Aloxaf/fzf-tab"

zinit snippet "OMZP::sudo"

HISTFILE="${HOME}/.zsh_history"
SAVEHIST=1000
HISTSIZE=1000

setopt appendhistory
setopt sharehistory

setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey -v

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^l' clear-screen

bindkey '^w' backward-kill-word
bindkey '^x' backward-delete-char

bindkey '^[[A' 'history-substring-search-up'
bindkey '^[[B' 'history-substring-search-down'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-za-z}'
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --line-range=:500 "${realpath}"'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview '[[ -d "${realpath}" ]] && exa --all --color=always --group-directories-first --icons --level 2 --tree "${realpath}" || bat --line-range=:500 "${realpath}"'
zstyle ':fzf-tab:complete:rm:*' fzf-preview '[[ -d "${realpath}" ]] && exa --all --color=always --group-directories-first --icons --level 2 --tree "${realpath}" || bat --line-range=:500 "${realpath}"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa --all --color=always --group-directories-first --icons --level 2 --tree "${realpath}"'

autoload -U 'compinit' && compinit
zinit cdreplay -q

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
