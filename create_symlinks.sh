!#/bin/bash

echo "Do you want create the symlinks?"
echo "type yes"
read answer

if [ $answer == "yes" ]; then

    DOTFILES_REPO="~/dotfiles"
    PATH_VIMRC="$HOME/.vimrc"
    PATH_TMUX="$HOME/.tmux.conf"
    DOTCONFIG="$HOME/.config/"

    # create the symlinks
    ln -sf $DOTFILES_REPO/vimrc $PATH_VIMRC
    ln -sf $DOTFILES_REPO/tmux.conf $PATH_TMUX

    # NeoVim
    # Create symlink for NeoVim
    ln -sf ~/dotfiles/nvim ~/.config/

    echo "Symlinks created successfully. Enjoy my NeoVim config!"
fi

