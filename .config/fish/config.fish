# CLEAR GREETING
set fish_greeting

# CUSTOM ALIASES
alias 'll'='ls -lha'
alias 'n'='nnn -C'
alias 'vsc'='code .'
alias 'pc'='podman-compose'
alias 'dc'='docker compose'
alias 'lg'='lazygit'

# CUSTOM KEYBINDINGS
bind \en 'nnn -dH; commandline -f repaint'

# SET EDITOR NVIM
set -gx EDITOR nvim

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

# SET PROMPT COLORS
# GRUVBOX
set -g hydro_color_pwd b8bb26
set -g hydro_color_git 8ec07c
set -g hydro_color_error fb4934
set -g hydro_color_prompt b8bb26
set -g hydro_color_duration fe8019

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

function dot -w git -d "Manages dotfiles"
    git --git-dir=$HOME/.dot --work-tree=$HOME $argv
end

