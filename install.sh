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

    echo 'install k'
    git clone https://github.com/supercrabtree/k ${HOME}/.oh-my-zsh/custom/plugins/k
    
fi

# Replace .zshrc file
mv -f ./.zshrc ${HOME}/.zshrc

# Append to .bashrc to make zsh alias to zs
echo 'appending alias to zsh command to .bashrc'
echo '# zsh alias' >> ${HOME}/.bashrc
echo "alias zs=zsh" >> ${HOME}/.bashrc

# Append to .bashrc to make extract alias to x
echo 'appending alias to extract alias to x'
echo '# extract alias' >> ${HOME}/.bashrc
echo 'alias extract=x' >> ${HOME}/.bashrc


