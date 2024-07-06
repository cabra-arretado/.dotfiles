#!/bin/bash

# Create symlinks to be managed by Stow

links=(
  vim
  nvim
  tmux
  wezterm
  )

for i in "${links[@]}"
do
    stow $i
done
