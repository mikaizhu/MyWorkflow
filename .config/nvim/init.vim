" TODO
" 1. 添加代码折叠功能
" 2. 为文件添加状态栏

" abbrev 是替换的缩写，i表示只有insert模式下才会起作用
" 将前面替换成后面, 遇到空格后替换
iabbrev @@    steve@stevelosh.com
iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.

" 自己定义新的移动方式：all 可以配合dall 和 yall复制和删除所有
onoremap al :<c-u>execute "normal! ggVG"<cr>

" bufwritePre会检测是否有新的缓存区出现，如果有则执行后面命令
" autocmd BufWritePre *.html :normal gg=G

" vim缓冲区的设置 <buffer>
" 缓冲区只对在同一个缓存区的文件有效, 下面代码只在某文件中leader键起作用
" :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
" :autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
""augroup mygroup
""  autocmd BufWrite * :echom "Foo"
""  autocmd BufWrite * :echom "Bar"
""augroup END


" vim operator learning
" 即可以自己定义移动的方式，vim常用的为 操作 + 移动
" Vim允许你创建任何新的movements，这些movements可以跟所有命令一起工作。
" 取消vim换行自动注释

" 让vim可以使用鼠标操作
set mouse=a

"set nopaste
set clipboard=unnamed
" Editing


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

" 打开记录行号, 会突出当前行, 打开相对行号
set nu relativenumber cursorline
syntax on
" 一行显示多少个字符

set textwidth=100


" 打开文件时回复上一次光标位置
"
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" vim font config: vim-devicons
autocmd BufEnter * setl formatoptions-=o " 禁止自动插入注释

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

" 函数中的指令，默认会在后面使用回车，所以不需要手动加入
function! Fln()
	:w!
	:FloatermNew
endfunction

nnoremap <silent> <Leader>fln :call Fln()<CR>
nnoremap <Leader>sh :FloatermShow<CR>
nnoremap <Leader>fk :FloatermKill<CR>
" 普通模式下如果send不加回车，可视模式下加回车，可以直接将可视部分send进命令
nnoremap <Leader>fs :FloatermSend
vnoremap <Leader>fs :FloatermSend<CR>


function! Ft()
	:w!
	:FloatermToggle<CR>
endfunction
nnoremap <silent> <Leader>of :call Ft()<CR>

"进入命令行模式后，要用tnoremap进行映射
tnoremap <silent> <leader>q <C-\><C-n>:FloatermToggle<CR>
" nnoremap <silent> <leader>o :FloatermToggle<CR>
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

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lervag/vimtex'

Plug 'sainnhe/gruvbox-material'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'puremourning/vimspector'

"language plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}



call plug#end()

" fzf config
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" coc config"
" extention can be found: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" 每次启动会自动为coc安装一些插件, 建议手动安装这些插件
"let g:coc_global_extensions = [
"			\'coc-clanged',
"			\'coc-cmake',
"			\'coc-python',
"			\'coc-git',
"			\'coc-sh',
"			\'coc-sql',
"			\'coc-textlab']

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

set updatetime=100
nnoremap <LEADER>h :call Show_documentation()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline_left_sep='>'


" telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


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
nnoremap <silent> J 5j
nnoremap <silent> H 5h
nnoremap <silent> K 5k
nnoremap <silent> L 5l

vnoremap <silent> J 5j
vnoremap <silent> H 5h
vnoremap <silent> K 5k
vnoremap <silent> L 5l


" 符号补全
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap [ []<Esc>i

