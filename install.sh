#!/bin/bash

sudo apt update

sudo apt dist-upgrade -y

# Install gitversion
echo 'install gitversion'
wget https://github.com/GitTools/GitVersion/releases/download/5.12.0/gitversion-linux-x64-5.12.0.tar.gz -O ~/gitversion-linux-64.tar.gz
if [ -f "${HOME}/gitversion-linux-64.tar.gz" ]; then
    echo 'unpacking ~/gitversion-linux-64.tar.gz'
    tar -xvf ~/gitversion-linux-64.tar.gz -C ${HOME}
    sudo chmod +x ${HOME}/gitversion
    echo 'moving gitversion into /usr/local/bin/'
    sudo mv ${HOME}/gitversion /usr/local/bin/
    echo "cleaning ${HOME}/gitversion-linux-64.tar.gz"
    rm -rf ~/gitversion-linux-64.tar.gz
fi

# Install fzf
echo 'install fzf'
sudo apt install fzf
sudo wget -P /usr/share/doc/fzf/examples/ https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh

# Install zsh plugin
if [ -d "${HOME}/.oh-my-zsh/custom/plugins" ]; then
    echo "install zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    # mv ${HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh ${HOME}/.oh-my-zsh/custom/plugins/
    # echo "# load zsh-autosuggestions" >>${HOME}/.zshrc
    # echo "source ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >>${HOME}/.zshrc

    echo "install zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    # mv ${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ${HOME}/.oh-my-zsh/custom/plugins/
    # echo "# load zsh-syntax-highlighting.git" >>${HOME}/.zshrc
    # echo "source ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>${HOME}/.zshrc
fi

# Replace .zshrc file
mv -f /workspaces/.codespaces/.persistedshare/dotfiles/.zshrc ${HOME}/.zshrc

# Make command alias
alias zs='zsh'
