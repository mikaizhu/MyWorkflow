#!/usr/bin bash

# 检查操作系统
if [[ `uname` == 'Darwin' ]]; then
  brew install zsh
  brew install autojump
fi

if [[ `uname` == 'Linux' ]]; then
  apt-get install software-properties-common
  apt update
  apt -y install zsh
  apt -y install autojump
  apt -y install neovim # 也可以使用源码安装
fi

# 安装oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc # 这里可以拷贝我自己的zshrc
chsh -s $(which zsh) # 设置系统默认使用zsh


