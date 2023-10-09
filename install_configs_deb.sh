#!/bin/bash

WORKSPACE="$HOME/workspace"

mkdir -p $WORKSPACE
cd $WORKSPACE

# INSTALL DEPENDENCIES AND TOOLS
printf "\nInstalling dependencies and tools. . .\n\n"
sudo apt-get install ninja-build gettext cmake unzip curl fish tmux

# DOWNLOAD AND INSTALL OR UPDATE NEOVIM
if [ -d "neovim" ]; then
    printf "\nUpdating NeoVim . . .\n\n"
    cd neovim
    git pull
    make distclean
else
    printf "\nInstalling NeoVim . . .\n\n"
    git clone https://github.com/neovim/neovim
    cd neovim
fi
make CMAKE_BUILD_TYPE=Release
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
fish $WORKSPACE/configs/install_fisher.fish

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
cp -r fish/ ~/.config/
cp -r nvim/ ~/.config/
cp tmux/tmux.conf ~/.tmux.conf

# SET FISH AS ACTIVE SHELL FOR USER
if [[ $SHELL != "/usr/bin/fish" ]]; then
    printf "\nSetting fish as active shell . . .\n\n"
    chsh -s /usr/bin/fish
fi
