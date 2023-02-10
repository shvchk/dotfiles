. /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle autojump
antigen bundle command-not-found
antigen bundle fzf
#antigen bundle git
#antigen bundle mosh
antigen bundle systemd
#antigen bundle marzocchi/zsh-notify
antigen bundle /usr/share/zsh-autosuggestions --no-local-clone
antigen bundle /usr/share/zsh-syntax-highlighting --no-local-clone

antigen apply

# Completion
autoload -Uz compinit
compinit

# Nav
setopt auto_cd                  # go to folder path without using cd
setopt cdable_vars              # change directory to a path stored in a variable
setopt extended_glob            # use extended globbing syntax

# History
HISTFILE=$ZDOTDIR/history
HISTSIZE=1000000
SAVEHIST=1000000

setopt extended_history         # record timestamp of command in HISTFILE
setopt hist_expire_dups_first   # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_all_dups     # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_verify              # show command with history expansion to user before running it
setopt share_history            # share command history data
setopt append_history           # append history to the history file (no overwriting)


. $ZDOTDIR/prompt
. $ZDOTDIR/aliases
. $ZDOTDIR/keybinds
. $ZDOTDIR/fixes


# zsh-notify settings
# zstyle ':notify:*' command-complete-timeout 5
# zstyle ':notify:*' error-title "T___T in #{time_elapsed}"
# zstyle ':notify:*' success-title "^___^ in #{time_elapsed}"
# zstyle ':notify:*' expire-time 5000
