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
antigen bundle /usr/share/zsh-autosuggestions --no-local-clone
antigen bundle /usr/share/zsh-syntax-highlighting --no-local-clone

antigen apply


prompt_hostname="@%F{039}$(hostname -f)"
am_i_remote=`loginctl show-session $XDG_SESSION_ID -p Remote --value`

if [[ "$am_i_remote" = "no" ]]; then
  prompt_hostname=''
fi

#PROMPT='❯ '
#RPROMPT='%~$(git_prompt_info) %F{250}%n@%f%F{039}$(hostname -f)%f'

PROMPT="%F{250}%n${prompt_hostname}%f %~$(git_prompt_info) > "
RPROMPT="%F{240}%D{%H:%M:%S}%f"
ZLE_RPROMPT_INDENT=0

precmd() {
  export last_command_finish_time=`date +%H:%M:%S`
}

# Show time when command is executed in RPROMPT: https://stackoverflow.com/q/13125825
function _accept-line {
  if [ -n "$last_command_start_time" ] && \
     [ -n "$last_command_finish_time" ] && \
     [ "$last_command_start_time" != "$last_command_finish_time" ]; then

    DATE_POS=$(( $COLUMNS - 9 ))
    echo -e "\e[${COLUMNS}D\e[K\e[${DATE_POS}C \e[38;5;240m${last_command_finish_time}\e[39"
  fi

  export last_command_start_time=`date +%H:%M:%S`
  zle reset-prompt
  zle .accept-line # Note the . meaning the built-in accept-line.
}

zle -N accept-line _accept-line

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

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

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Aliases
alias fd='fdfind'
alias bat='batcat'
