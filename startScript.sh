#!bin/bash

echo "Installation Starting"

if [ ! "$(which brew)" ]
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! "$(which zsh)" ]
then
    echo "Installing Zsh"
fi

if [ ! "$(which omz)" ]
then
    echo "Installing Omzsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! "$(which tmux)" ]
then
    echo "Installing Tmux"
    brew install tmux
fi

if [ ! "$(which nvim)" ]
then
    echo "Installing Neovim"
    brew install neovim
fi

if [ ! "$(which stow)" ]
then
    echo "Installing GNU Stow"
    brew install stow
fi

set -e

for i in .bashrc .zshrc .vimrc .tmux.config
do
    echo "Cleaning $i"
    [ -f "$HOME/$i" ] && rm "$HOME/$i"
done

echo "Stow symlinks"
stow -vSt ~ */

echo "Installing Font"
brew tap homebrew/cask-fonts
brew install --cask font-dejavu-sans-mono-nerd-font

echo "Installation Complete"
