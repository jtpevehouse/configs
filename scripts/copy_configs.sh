#!/bin/bash

print_usage() {
    printf """
	Usage:		$0 [-h] [-w] [-y]

	Options:
		-l		Update the configs in the home config dir with what's in the workspace config dir
		-w		Update the configs in the workspace config dir with what's in the home config dir
		-y		Disable confirmation message
    """
}

confirm_update(){
    if [[ -n $CONTINUE_OVERRIDE ]]; then
        echo yes
        exit 0
    fi

    read -p "Do you want to replace configs in $1 with configs in $2? (y/n) " yn

    case $yn in
        y ) echo yes ;;
        n ) echo no ;;
        * ) echo invalid response ;;
    esac
}

while getopts "lwhy" OPTION; do
    case "$OPTION" in
        l)
            DEST_DIR="$HOME/.config"
            SRC_DIR="$HOME/workspace/configs"
            TMUX_SRC="$SRC_DIR/tmux/tmux.conf"
            TMUX_DEST="$HOME/.tmux.conf"
            UPDATE_LOCAL=1
            ;;
        w)
            DEST_DIR="$HOME/workspace/configs"
            SRC_DIR="$HOME/.config"
            TMUX_SRC="$HOME/.tmux.conf"
            TMUX_DEST="$DEST_DIR/tmux/tmux.conf"
            UPDATE_WORKSPACE=1
            ;;
        y)
            CONTINUE_OVERRIDE=1 ;;
        h)
            print_usage
            exit 0
            ;;
    esac
done

if [[ -n $UPDATE_LOCAL ]] && [[ -n $UPDATE_WORKSPACE ]]; then
    echo "Invalid input"
    print_usage
    echo "Can't do both man . . ."
    exit 1
fi

if [[ -z "$DEST_DIR" ]]; then
    echo "Invalid input. . ."
    print_usage
    exit 0
fi

CONTINUE=$(confirm_update $DEST_DIR $SRC_DIR)
if [[ $CONTINUE == "yes" ]]; then
    echo "Updating local configs . . ."
    cp -rf $SRC_DIR/fish/ $SRC_DIR/nvim $DEST_DIR
    yes | cp -i $SRC_DIR/alacritty/* $DEST_DIR/alacritty
    yes | cp -i $TMUX_SRC $TMUX_DEST
    echo "Done!"
elif [[ $CONTINUE == "invalid response" ]]; then
    echo "Invalid response"
    exit 1
else
    echo "Configs will not be updated"
    exit 0
fi
