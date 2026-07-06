# CLEAR GREETING
set fish_greeting

# CUSTOM ALIASES
alias 'll'='ls -lha'
alias 'n'='nnn -C'
alias 'vsc'='code .'
alias 'pc'='podman-compose'
alias 'dc'='docker compose'
alias 'lg'='lazygit'
alias 'git-sub-nuke'='git submodule deinit -f --all'

# WORK SERVER ALIASES
set did_daily kc3xnw-xjjayx000.garmin.com
set did_feature kc3xnw-xjjayx001.garmin.com
set did_release kc3xnw-xjjayx002.garmin.com
set did_pre_merge kc3xnw-xjjayx003.garmin.com
set did_testing kc3xnw-xjjayx004.garmin.com

# SET EDITOR NVIM
set -gx EDITOR nvim

# CUSTOM KEYBINDINGS
bind \en 'nnn -dH; commandline -f repaint'

# NNN COLORS
# NORD
set BLK 0B
set CHR 0B
set DIR 04
set EXE 06
set REG 00
set HARDLINK 06
set SYMLINK 06
set MISSING 00
set ORPHAN 09
set FIFO 06
set SOCK 0B
set OTHE R06

export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# SET HYDRO PROMPT COLORS
# EVERFOREST
set -g hydro_color_pwd A7C080
set -g hydro_color_git D699B6
set -g hydro_color_error E67E80
set -g hydro_color_prompt 7FBBB3
set -g hydro_color_duration E69875

# UPDATE NEOVIM
function update-nvim --description 'Update NeoVim to the latest nightly build appimage'
    curl -Lo nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
    chmod +x nvim.appimage

    sudo rm -r /squashfs-root
    sudo rm /usr/bin/nvim

    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version

    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

    mv -f nvim.appimage ~/.local/bin/
end

# UPDATE OBSIDIAN
function update-obsidian --description 'Update Obsidian to the latest release appimage'
    curl -Lo Obsidian.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.4/Obsidian-1.8.4.AppImage
    chmod +x Obsidian.AppImage

    mv -f Obsidian.AppImage /home/pevehousejosh/appimages/

    if pgrep obsidian
        pkill obsidian
        /home/pevehousejosh/appimages/Obsidian.AppImage &
        disown
    end
end

# UPDATE LAZYGIT
function update-lazygit --description 'Update LazyGit to the latest release'
    set CUR_DIR (pwd)
    set LG_VERSION (curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
    set LG_CURL_URL https://github.com/jesseduffield/lazygit/releases/download/v"$LG_VERSION"/lazygit_"$LG_VERSION"_Linux_x86_64.tar.gz
    set LG_DOWNLOAD_DIR /home/pevehousejosh/Downloads/lazygit

    mkdir $LG_DOWNLOAD_DIR
    cd $LG_DOWNLOAD_DIR

    curl -Lo lazygit.tar.gz "$LG_CURL_URL"
    tar xvf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/

    cd $CUR_DIR
    rm -r $LG_DOWNLOAD_DIR
end

# UPDATE KITTY
function update-kitty --description 'Update Kitty terminal to the latest binary release'
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
end

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

# INTERACT WITH BARE REPO CONFIGS
function dot -w git -d "Manages dotfiles"
    git --git-dir=$HOME/.dot --work-tree=$HOME $argv
end

# REMOVE SOMETHING FROM THE PATH
function remove_path
    if set -l index (contains -i "$argv" $fish_user_paths)
        set -e fish_user_paths[$index]
        echo "Removed $argv from the path"
    end
end

# REBUILD SUBMODULES IN A REPOSITORY
function git_sub_rebuild
    if test -e $PWD/.gitmodules
        git submodule deinit -f --all
        git submodule sync --recursive
        git submodule update --init --recursive
    else
        echo "No submodles to rebuild"
    end
end

# KILL ALL FLOATING TMUX WINDOWS
function tmux_kill_floating
    set floating_sessions (tmux ls -F '#{session_name}' | grep 'p-')
    for session in $floating_sessions
        tmux kill-session -t $session
        echo "Killed floating session: $session"
    end
end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
