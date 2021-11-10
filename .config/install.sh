#!/usr/bin bash

# 安装对应的环境
if ["$(uname)"=="Darwin"]; then
	brew install ripgrep
elif ["$(uname)"=="Linux"]; then
	sudo apt update
	sudo apt install ripgrep
elif ["$(uname)"=="MINGW32_NT"]; then
	choco install ripgrep

