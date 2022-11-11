#!bin/bash

echo "Installation Starting"

if [ ! "$(which brew)" ]
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew Already Installed"
fi

if [ ! "$(which zsh)" ]
then
    echo "Installing Zsh"
else
    echo "Zsh Already Installed"
fi

if [ -d "~/.oh-my-zsh" ] 
then
    echo "Installing Omzsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installing Plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "OMZ Already Installed"
fi

if [ ! "$(which tmux)" ]
then
    echo "Installing Tmux"
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Tmux Already Installed"
fi

if [ ! "$(which nvim)" ]
then
    echo "Installing Neovim"
    brew install neovim
else
    echo "Nvim Already Installed"
fi

if [ ! "$(which stow)" ]
then
    echo "Installing GNU Stow"
    brew install stow
else
    echo "Stow Already Installed"
fi

if [ ! "$(which stow)" ]
then
    echo "Installing Font"
    brew tap homebrew/cask-fonts
    brew install --cask font-dejavu-sans-mono-nerd-font
else
    echo "Fonts Already Installed"
fi

set -e

for i in .bashrc .zshrc .vimrc .tmux.conf
do
    echo "Cleaning $i"
    [ -f "$HOME/$i" ] && rm "$HOME/$i"
done

echo "Stow symlinks"
stow -vSt ~ */

if [ ! "$(command -v nvm)" ]
then
    echo "Installing NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
else
    echo "NVM Already Installed"
fi

echo "Installation Complete"
