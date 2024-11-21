#!/bin/bash

WORKSPACE="$HOME/workspace"

mkdir -p $WORKSPACE
cd $WORKSPACE

download_github_release() {
	RELEASE_NAME="$1"
	REPO_PATH="$2"
	RELEASE_TYPE="$3"

	REPO_TARBALL="${RELEASE_NAME}.tar.gz"
	REPO_RELEASE="${RELEASE_NAME}_release_unzip"
	rm -rf $REPO_RELEASE
	mkdir $REPO_RELEASE
	REPO_DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO_PATH}/releases/${RELEASE_TYPE}" \
	    | grep "download_url.*${RELEASE_NAME}.*\.tar\.gz\""| cut -d '"' -f 4)
	wget $REPO_DOWNLOAD_URL -O $REPO_TARBALL
	tar -xvf $REPO_TARBALL -C $REPO_RELEASE --strip-components=1
	cd $REPO_RELEASE
}

# INSTALL DEPENDENCIES AND TOOLS
printf "\nInstalling dependencies and tools. . .\n\n"
sudo apt-get install ninja-build gettext cmake unzip curl fish nodejs npm luarocks

# DOWNLOAD AND INSTALL OR UPDATE NEOVIM
download_github_release "nvim-linux64" "neovim/neovim" "tags/nightly"
sudo cp -r ./* /usr/
cd $WORKSPACE

# INSTALL OR UPDATE NNN FILE MANAGER
printf "\nInstalling NNN File Manager . . .\n\n"
sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
download_github_release "nnn-v" "jarun/nnn" "latest"
sudo make strip install
cd $WORKSPACE

# INSTALL OR UPDATE TMUX
printf "\nInstalling TMUX . . .\n\n"
sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config
download_github_release "tmux" "tmux/tmux" "latest"
sudo ./configure
sudo make 
sudo make install
cd $WORKSPACE

# INSTALL OR UPDATE TPM
if [ -d "~/.tmux/plugins/tpm" ]; then
    printf "\nInstalling TPM . . .\n\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    printf "\nUpdating TPM . . .\n\n"
    cd ~/.tmux/plugins/tpm
    git pull
fi

cd $WORKSPACE

# INSTALL FISHER AND PLUGINS
fish $WORKSPACE/configs/scripts/install_fisher.fish

# PULL DOWN OR UPDATE CONFIGS
if [ ! -d "$WORKSPACE/configs" ]; then
    printf "\nPulling down configs\n\n"
    git clone https://github.com/jtpevehouse/configs.git $WORKSPACE/configs
    cd configs
else
    cd configs
    git pull
fi

# COPY CONFIG FILES TO LOCAL MACHINE
printf "Copying configs to local machine . . .\n\n"
$WORKSPACE/configs/scripts/copy_configs.sh -ly

# SET FISH AS ACTIVE SHELL FOR USER
if [[ $SHELL != "/usr/bin/fish" ]]; then
    printf "\nSetting fish as active shell . . .\n\n"
    chsh -s /usr/bin/fish
fi
