#!/bin/bash

links=(
  vim
  nvim
  tmux
  )

for i in "${links[@]}"
do
    stow $i
done
