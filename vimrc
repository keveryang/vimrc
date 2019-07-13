call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'iamcco/markdown-preview.vim'
nmap <silent> <F8> :MarkdownPreview<CR>
nmap <silent> <F9> :MarkdownPreviewStop<CR>
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0


call plug#end()

" 显示行号 "
set nu

" 双击鼠标不要进入virtual模式 "
set mouse=

" no clear screen when exit vim
set t_ti= t_te=

set tabstop=8
set cc=80
set sw=8

"set list
"set listchars=tab:>-,trail:~,extends:>,precedes:<
syntax on
syntax enable
set number
set ruler
"set relativenumber
set hidden
set nowrap
set autoread
set cursorline
set clipboard^=unnamed,unnamedplus
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set foldmethod=indent
set foldlevel=99
set nofoldenable
set history=10000

" Turn backup off, since most stuff is in SVN, git etc.
set nowb
set nobackup
set noswapfile

set ignorecase
set smartcase
set hlsearch
set incsearch

let loaded_matchparen = 1 " disable math parenthiese

let g:gutentags_add_default_project_roots = 0

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root']

" " 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

if isdirectory("kernel/") && isdirectory("mm/")
    let g:gutentags_file_list_command = 'find arch/arm* arch/riscv block crypto drivers fs include init ipc kernel lib mm net security sound virt'
endif

" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" move cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" search word under cursor, the pattern is treated as regex, and enter normal
" mode directly
noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR>
highlight Lf_hl_rgHighlight guifg=#000000 guibg=#CCCC66 ctermfg=green ctermbg=185
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match0 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match1 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match2 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match3 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match4 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=green

autocmd! bufwritepost $HOME/.vimrc source %

" 打开文档后自动定位到上一次关闭时的位置 "
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif
