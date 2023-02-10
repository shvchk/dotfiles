PATH_ADD=(
  "$HOME/bin"
  "$HOME/.local/bin"
  "/var/lib/flatpak/exports/bin"
)

for d in "${PATH_ADD[@]}"; do
  [ -d "$d" ] && PATH="$d:$PATH"
done


export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# clean ~
export ADOTDIR="$XDG_DATA_HOME/antigen"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE=-
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djavafx.cachedir="$XDG_CACHE_HOME"/openjfx

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export KDEHOME="$XDG_CONFIG_HOME/kde"

# --------------------------------

export TIME_STYLE="long-iso"
export EDITOR="micro"
#[[ -n "$DISPLAY" ]] && export VISUAL="xdg-open"
