# CLEAR GREETING
set fish_greeting

# SET THEME
theme_gruvbox dark medium

# CUSTOM ALIASES
alias 'nv'='nvim'
alias 'll'='ls -lha'
alias 'n'='nnn -C'
alias 'vsc'='code .'
alias 'pc'='podman-compose'

# CUSTOM KEYBINDINGS
bind \en 'nnn -C; commandline -f repaint'

# SET EDITOR NVIM
set -gx EDITOR nvim

# SET PROMPT COLORS
set -g hydro_color_pwd b8bb26
set -g hydro_color_git 8ec07c
set -g hydro_color_error fb4934
set -g hydro_color_prompt b8bb26
set -g hydro_color_duration fe8019

# NNN CD ON EXIT
function nnn --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end

    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    command nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

# LAUNCH TMUX BY DEFAULT
if not set -q TMUX
    set -g TMUX tmux new-session -d -s home
    eval $TMUX
    tmux attach-session -d -t home 
end
