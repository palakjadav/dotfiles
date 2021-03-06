#!/bin/bash

# Installs zsh, registers zsh as a default shell

brew install zsh zsh-completions
zsh_path=$(which zsh)
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
brew install zsh-syntax-highlighting
