!#/bin/bash

echo "Do you want create the symlinks?"
echo "type yes"
read answer

if [ $answer == "yes" ]; then

    PATH_VIMRC="$HOME/.vimrc"
    PATH_NVIM="$HOME/.config/nvim"
    PATH_NVIMCONFIG="$HOME/.config/nvim/init.lua"
    PATH_TMUX="$HOME/.tmux.conf"

    PATH_OLD="$HOME/.original_dotfiles"
    DOTFILES_REPO="$HOME/dotfiles"

    # Check if the PATH_OLD exists, if not, create it
    if [ ! -d "$PATH_OLD" ]; then
	mkdir $PATH_OLD
    fi 

    # check if PATH_NVIM exists, if not, create it
    if [ ! -d "$PATH_NVIM" ]; then
	mkdir $PATH_NVIM
    fi

    # try to move the old files to the PATH_OLD
    mv $PATH_VIMRC $PATH_OLD
    mv $PATH_NVIMCONFIG $PATH_OLD
    mv $PATH_TMUX $PATH_OLD

    # create the symlinks
    ln -sf $DOTFILES_REPO/vimrc $PATH_VIMRC
    ln -sf $DOTFILES_REPO/tmux.conf $PATH_TMUX

    # NeoVim
    ln -sf $DOTFILES_REPO/init.lua $PATH_NVIMCONFIG
    sudo ln -sf $DOTFILES_REPO/lua $PATH_NVIM/lua

    echo "Symlinks created successfully. Old files moved to $PATH_OLD. Enjoy my NeoVim config!"
fi

