!#/bin/bash

echo "Do you want create the symlinks?"
echo "type yes"
read answer

if [ $answer == "yes" ]; then

    DOTFILES_REPO="~/dotfiles"
    PATH_VIMRC="$HOME/.vimrc"
    PATH_TMUX="~/.tmux.conf"
    DOTCONFIG="~/.config/"

    # create the symlinks
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

    # NeoVim
    # Create symlink for NeoVim
    ln -sf ~/dotfiles/nvim ~/.config/

    echo "Symlinks created successfully. Enjoy my NeoVim config!"
fi

