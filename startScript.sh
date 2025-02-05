#!bin/bash

set -e

echo "Installation Starting"

if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew Already Installed"
fi

if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh"
    brew install zsh
else
    echo "Zsh Already Installed"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installing Plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "Oh My Zsh Already Installed"
fi

if ! command -v tmux &> /dev/null; then
    echo "Installing Tmux"
    brew install tmux
    # reference here https://github.com/tmux-plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Tmux Already Installed"
fi

if ! command -v nvim &> /dev/null; then
    echo "Installing Neovim"
    brew install neovim
else
    echo "Neovim Already Installed"
fi

if ! command -v stow &> /dev/null; then
    echo "Installing GNU Stow"
    brew install stow
else
    echo "Stow Already Installed"
fi

if ! brew list --cask | grep -q "font-dejavu-sans-mono-nerd-font"; then
    echo "Installing Font"
    brew install --cask font-dejavu-sans-mono-nerd-font
else
    echo "Fonts Already Installed"
fi


for i in .bashrc .zshrc .vimrc .tmux.conf
do
    echo "Cleaning $i"
    [ -f "$HOME/$i" ] && rm "$HOME/$i"
done

echo "Stow symlinks"
stow -vSt ~ */

if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
    echo "NVM Already Installed"
fi

if ! command -v rbenv &> /dev/null; then
    echo "Installing rbenv"
    brew install rbenv
else
    echo "rbenv Already installed"
fi

echo "Installation Complete"
