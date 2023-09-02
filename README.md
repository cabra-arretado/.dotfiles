# Instructions
Those are my dotfile, wrote for my personal use. Use at your own risk (:

## Script
To use just run the `create_symlinks.sh` and add a line with `source alias.sh` to your `.bashrc` or `.zshrc`.

## Test-drive Docker support
It won't be perfect but you can get a feel of Neovim config using Docker
```
docker run -w /root -it --rm alpine:latest sh -uelic '
  apk add bash git nodejs neovim ripgrep build-base wget tmux --update
  git clone https://github.com/cabra-arretado/dotfiles.git
  mkdir .config
  cd dotfiles && ./create_symlinks.sh
  nvim '
```

TODO:
- To make the install script more efficient:
    - To create the folder for .config/nvim if non existing.
    - To create a Makefile with the install Makefile
- Make that README better.
DONE - Install Lazy.nvim
- Create check if floating buffer and if so close before opening other floating buffer
