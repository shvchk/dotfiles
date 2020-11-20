source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme kardan

antigen bundle git
antigen bundle command-not-found
antigen bundle autojump
antigen bundle common-aliases
#antigen bundle mosh
antigen bundle systemd
antigen bundle urltools
#antigen bundle marzocchi/zsh-notify
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle /usr/share/zsh-syntax-highlighting --no-local-clone

antigen apply

PROMPT='%F{250}%n@%f%F{039}$(hostname -f)%f %~$(git_prompt_info) > '
RPROMPT=''

#PROMPT='❯ '
#RPROMPT='%~$(git_prompt_info) %F{250}%n@%f%F{039}$(hostname -f)%f'

# zsh-notify settings
#zstyle ':notify:*' command-complete-timeout 5
#zstyle ':notify:*' error-title "T___T in #{time_elapsed}"
#zstyle ':notify:*' success-title "^___^ in #{time_elapsed}"
#zstyle ':notify:*' expire-time 5000

# History
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob
bindkey -e

# Key bindings
bindkey '5~' kill-word
bindkey '^H' backward-kill-word

# Compinstall
zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
compinit
