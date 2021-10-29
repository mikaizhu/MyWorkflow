# MyWorkflow

本项目的目标：一键配置电脑环境，因为有时候我们需要在服务器上，或者换新设备，每
次都需要重新配置环境。本项目将直接运行：`./install.sh` 就可以在线配置好环境.

本项目还将支持离线安装环境，因为有些服务器不方便联网.

OS：
- MacOS
- Ubuntu20.04

工具：
- zsh
- vim
- fzf

# workflow配置

## 下载nvim

```
sudo apt install nvim
```

然后将nvim命令绑定为vim，vi

```
vi ~/.zshenv // 每次打开一个窗口，都会执行里面的代码
or vi ~/.bashrc
```

```
alias vi=nvim
alias vim=nvim
```

推荐两个vim配置：
- vim: https://github.com/youngyangyang04/PowerVim

## nvim配置需求

需求：
- 复制粘贴可以跨平台(服务器上复制，可以本地粘贴)
- 代码可以进行补全
- 可以进行程序debug(可以服务器也可以本地debug)
- 可以在vim中运行终端命令
- 可以在vim中进行当前目录的文件搜索
- 方便markdown记录笔记

## vim插件管理

- https://github.com/junegunn/vim-plug

在nvim即init.vim目录下，建立一个文件夹autoload，下载plug.vim，然后放在这个目录
中即可, 或者直接吧文件下载下来，然后复制进去即可

目录结构应该:

```
~/.config/nvim/autoload/plug.vim
```

下载完文件，然后放在上面目录结构:
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

运行:
```
:PlugInstall
```

如果服务器不能翻墙，插件的安装本质还是github上clone下来

如果不想使用某插件，可以直接在plugin中删除那一行, vim就不会加载这个配置

## 复制粘贴设置

- https://github.com/fcpg/vim-osc52

```
Vundle - Plugin 'fcpg/vim-osc52'
vmap <C-c> y:Oscyank<cr>
```

# zsh 配置

网站：https://github.com/ohmyzsh/ohmyzsh

主要文件:

- $HOME/.zshenv 每次启动都会运行里面的命令
- $HOME/.zshrc 配置zsh的文件

> .zshenv 这个文件是每次都会被在启动时加载的，这里一般存放需要导出的一些全局变量,比如 JAVA_HOME 、GOPATH 这种。PATH , EDITOR 以及PAGER一般也可以放在这里，如果你想变更zsh配置文件的其他存放位置，可以通过设置 ZDOTDIR 变量来指定；alias 等
> .zshrc 这里是交互式Shell配置，我们就是在这里加载模块、变更历史配置、更改提示符等等。在这里可以设置一些本地使用的变量；

推荐的插件有：

- autojump
- vim-mode


