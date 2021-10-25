" abbrev 是替换的缩写，i表示只有insert模式下才会起作用
" 将前面替换成后面, 遇到空格后替换
iabbrev @@    steve@stevelosh.com
iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.

" 自动命令学习:autocmd
" :autocmd BufNewFile * :write
"         ^          ^ ^
"         |          | |
"         |          | 要执行的命令
"         |          |
"         |          用于事件过滤的“模式（pattern, 如果是*.txt则只对txt文件有效”
"         |
"         要监听的“事件”
" bufwritePre会检测是否有新的缓存区出现，如果有则执行后面命令
" autocmd BufWritePre *.html :normal gg=G

" vim缓冲区的设置 <buffer>
iabbrev <buffer> --- &mdash;

let g:mapleader=';'

" indent config
" 可以用set同时设置多个值，中间用空格分隔
" python 默认tab为4个空格，cindent为
set cindent shiftwidth=4 tabstop=4 autoindent smartindent

" vim大小写设置, 设置为不区分大小写
" 只能匹配如果有大写，则不匹配小写
set ignorecase
set smartcase

" 快速打开vim配置文件
nnoremap <leader>ev :vsplit $HOME/.config/nvim/init.vim<CR>

" 撤销和恢复操作
" u是恢复，U是撤销恢复
nnoremap U <C-r>

" 打开记录行号
set nu 
syntax on

"" 打开文件时回复上一次光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


" vim font config: vim-devicons
set encoding=UTF-8
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" vim theme config: gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" cnoremap是命令行模式下在有用的map
" 如果有提示，本来是C-n切换提示项，映射为C-j
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" floaterm config
" 设置shell不是浮动，而是右边option：split vsplit float
let g:floaterm_wintype='vsplit'
" 设置为一半
let g:floaterm_height=0.5
let g:floaterm_width=0.5
"让terminal打开默认的是当前项目的目录下"
let g:floaterm_borderchars='.root'

" 这里fn命令不建议加回车，因为可以有后面操作
function CreateFloaterm()
	w<CR>	
	FloatermNew
endfunction

nnoremap <silent> <Leader>fn :call CreateFloaterm()<CR>
nnoremap <Leader>sh :FloatermShow<CR>
nnoremap <Leader>fk :FloatermKill<CR>
" 普通模式下如果send不加回车，可视模式下加回车，可以直接将可视部分send进命令
nnoremap <Leader>fs :FloatermSend
vnoremap <Leader>fs :FloatermSend<CR>

nnoremap <silent> <Leader>ft :w<CR>:FloatermToggle<CR>
"进入命令行模式后，要用tnoremap进行映射
tnoremap <silent> <C-[> <C-\><C-n>:FloatermToggle<CR>
" 从termial切换窗口, 有时候会和tmux按键冲突，可以替换成其他的
tnoremap <silent> <C-b>h <C-\><C-n><C-w>h
nnoremap <silent> <C-b>l <C-w>l


" plug 
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ojroques/vim-oscyank'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'voldikss/vim-floaterm'
call plug#end()


" nerd tree config
" use C-w + h l to switch windows
nnoremap <leader>nt :NERDTree<CR>

" osyank config
" 如果使用osyank，必须在v模式下选中, 然后y复制，使用control v粘贴而不是p
" 使用:reg查看寄存器中的内容
vnoremap y :OSCYank<CR>
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

"" my setting
" 设置leader键加q为宏录制，要停止录制宏，同样用,q,
" 速度要快，大概只有0.几秒的反应时间
nnoremap <Leader>q q
" nnoremap为防止递归调用，这样使用leader q就不是wq了
nnoremap q :wq<CR>
inoremap jj <Esc>:w<CR>

" fast move config
nnoremap J 5j
nnoremap H 5h
nnoremap K 5k
nnoremap L 5l

vnoremap J 5j
vnoremap H 5h
vnoremap K 5k
vnoremap L 5l

" 符号补全
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
