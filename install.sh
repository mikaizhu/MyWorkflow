#!/usr/bin bash

# 如果脚本不能运行，则手动一行行执行下面代码
# 检查操作系统
if [[ `uname` == 'Darwin' ]]; then
  brew install zsh
  brew install autojump
  # fzf vim 需要安装的
  brew install the_silver_searcher
  brew install ripgrep
  brew install bat
  pip3 install pynvim
fi

if [[ `uname` == 'Linux' ]]; then
  apt-get install software-properties-common
  add-apt-repository ppa:neovim-ppa/stable # 升级软件库
  apt update
  apt -y install zsh
  apt -y install autojump
  apt -y install neovim # 也可以使用源码安装
  pip3 install pynvim # 为nvim安装python3支持

  # 如果安装不了下面几个，则在vim中使用不了fzf
  apt-get -y install silversearcher-ag
  apt-get -y install ripgrep # 如果左边命令使用不了，则用右边这个apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
  apt -y install bat
fi

# 安装oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc # 这里可以拷贝我自己的zshrc
chsh -s $(which zsh) # 设置系统默认使用zsh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


