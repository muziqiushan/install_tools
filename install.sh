#!/bin/bash
#pull dotfile from github

#install node
if [ ! -n $1 ]||[ $1 -ge 1 ];then
    sudo yum install 
    curl -sL https://rpm.nodesource.com/setup_current.x | sudo bash -
    if [ $? -ne 0 ]
        echo "install node failed! continue: 1";exit;
    fi
fi

#install neovim
if [ ! -n $1 ]||[ $1 -ge 2 ];then
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    if [ ! -f nvim.appimage ]
        echo "install neovim failed! continue: 2";exit;
    fi
    chmod u+x nvim.appimage
    mkdir -p $HOME/bin
    mv nvim.appimage $HOME/bin/
    ln -s $PWD/nvim.appimage nvim
    ln -s $PWD/nvim.appimage n
    nvim --headless +PlugInstall +qall
fi
#install zsh
if [ ! -n $1 ]||[ $1 -ge 3 ];then
    sudo yum -y install zsh
    if [ $? -ne 0 ]
        echo "install zsh failed! continue: 3";exit;
    fi
    chsh -s $(which zsh) $USER
    su - $USER
fi
#install .dotfile
if [ ! -n $1 ]||[ $1 -ge 10 ];then
    if [ -d dotfile ];then
        # backup dotfile
        mkdir dotfile.bk
        cp ~/.gitconfig dotfile.bk
        cp -r ~/.config dotfile.bk
        # cp dotfile
        cp -r dotfile/.gitconfig ~/
        cp -r dotfile/.config ~/
        cp -r dotfile/.zshrc ~/
        source ~/.zshrc
    fi
fi
