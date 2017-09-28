" https://github.com/amix/vimrc

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" highlight search pattern
set hls

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
"set foldcolumn=1

" bright forecolor"
set background=dark

" tab and space
" et:   expandtab
" sta:  smarttab
" sts:  softtabstop
" ts:   tabstop
" sw:   shiftwidth
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"autocmd FileType yaml setlocal et sta sw=2 sts=2 ts=2
"autocmd FileType python setlocal et sta sw=4 sts=4 ts=4

" Enable syntax highlighting
syntax enable

try
    colorscheme desert
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
set noswapfile

set laststatus=2
"set statusline=%F%m%r%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ %l:%v[%2p%%\ of\ %L]
"set statusline=%F%m%r%h%w\ %l:%v[%2p%%\ of\ %L]
set statusline=%F%m%r%h%w\ %l/%L[%2p%%]:%v
set statusline+=%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=[%{&ff}][%Y]\ \|\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}


au VimLeave * if filereadable("[path here]/.netrwhist")|call delete("[path here]/.netrwhist")|endif
