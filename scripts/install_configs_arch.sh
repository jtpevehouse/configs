#!/bin/bash

WORKSPACE="$HOME/workspace"

mkdir -p $WORKSPACE
cd $WORKSPACE

# INSTALL DEPENDENCIES AND TOOLS
printf "\nInstalling dependencies and tools. . .\n\n"
sudo pacman -S fish tmux nnn neovim kitty

# INSTALL OR UPDATE TPM
if [ -d "~/.tmux/plugins/tpm" ]; then
	printf "\nInstalling TPM . . .\n\n"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	printf "\nUpdating TPM . . .\n\n"
	cd ~/.tmux/plugins/tpm
	git pull
fi

# CONFIGURE LOCAL ENVIRONMENT
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
