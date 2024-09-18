" --------
" General
" --------

set autoread
set backspace=indent,eol,start
set browsedir=buffer
set clipboard+=unnamed
set cmdheight=3
set encoding=utf-8
set formatoptions=lmMoq
set guioptions+=a
set hidden
set iminsert=0 imsearch=0
set lazyredraw
set modelines=0
set mouse=a
set nobackup
set noimcmdline
set noswapfile
set notitle
set noundofile
set scrolloff=5
set showcmd
set showmode
set ttyfast
set vb t_vb=
set viminfo='50,<1000,s100,\"50
set whichwrap=b,s,h,l,<,>,[,]


" remap
let g:mapleader = "\<Space>"

" ------
" window
" ------

set cursorline
" highlight only current window
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline

" tab
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <silent> <Leader>j gt
nnoremap <silent> <Leader>k gT
nnoremap <silent> <Leader>- :<C-u>sp<CR>
nnoremap <silent> <Leader>\ :<C-u>vs<CR>
nnoremap <silent> <Leader>J <C-w>j
nnoremap <silent> <Leader>K <C-w>k
nnoremap <silent> <Leader>L <C-w>l
nnoremap <silent> <Leader>H <C-w>h

" --------
" editing
" --------

""filetype plugin indent on
set wrap
set expandtab
" trim ended whitespaces when saved
autocmd BufWritePre * :%s/\s\+$//ge
" convert tabs into spaces when saved
autocmd BufWritePre * :%s/\t/  /ge
highlight ColorColumn ctermbg=cyan guibg=cyan
" show zenkaku space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" show how invisible strings are
"set list
"set listchars=tab:>.,trail:_,extends:>,precedes:<
"set display=uhex

" -------
" moving
" -------

noremap j gj
noremap k gk
nmap 1 0
nmap 0 ^
nmap 9 $
"move previous ended position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"move corresponding bracket
nnoremap ( %
nnoremap ) %
"move between buffer
nnoremap <Leader>bk :bprevious<CR>
nnoremap <Leader>bj :bnext<CR>
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bd :bdelete<CR>

" ------
" indent
" ------

set tabstop=2 shiftwidth=2 softtabstop=2
"set autoindent
""set shiftround
""set foldenable
""set foldmethod=marker

" -------
" search
" -------

set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" ----------
" statusline
" ----------

""set number
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
" set ruler
" set rulerformat=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
"set statusline=%f:\ %{substitute(getcwd(),'.*/','','')}\ %m%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B
"set showcmd
"set showmode
"set showmatch

" -----------
" spell check
" -----------

" toggle spell checking on/off
nnoremap <silent> <Leader>z :<C-u>setl spell! spell?<CR>
" `z=` show suggestions for bad words
" set spelllang=en,cjk
