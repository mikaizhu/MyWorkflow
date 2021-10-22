set encoding=UTF-8

" plug 
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ojroques/vim-oscyank'
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:mapleader=';'

" nerd tree config
nnoremap <leader>n :NERDTree<CR>

" osyank config
vnoremap y :OSCYank<CR>
nnoremap yy :OSCYank<CR>
"nnoremap p i<C-v><Esc>

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
