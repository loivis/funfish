" A combination of:
" https://github.com/amix/vimrc
" https://github.com/jsageryd/.config.d/blob/master/vim/.vimrc

execute pathogen#infect()
" execute pathogen#helptags()

" Vim is the future
set nocompatible

" Set leader to ,
let mapleader = ","

" Avoid modelines (CVE-2007-2438)
set modelines=0

" Use auto-indent
" set autoindent
set ai

" Show line numbers
" set number
set nu

" Briefly show matching bracket
set showmatch

" Show file name in window header
set title

" Enable syntax colouring/highlighting
syntax on
syntax enable

" Try to prevent syntax colouring from breaking on large files
syntax sync fromstart

" Prevent line wrapping
set nowrap

" Make lowercase searches case-insensitive, mixed/upper-case case-sensitive
set ignorecase
set smartcase

" Prevent lines breaking in the middle of words
set linebreak

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set encoding for terminal display
set encoding=utf-8

" Default encodings written to files
" - Allow BOM to be recognised in an UTF-8 file
" - Use plain UTF-8 if there is no BOM
" - Allow non-latin1 to be recognised before latin1
" - Try latin1 if the file is not any of the above
" -extra CJKs: cp936,gb18030,big5,euc-jp,euc-kr,
set fileencodings=ucs-bom,utf-8,default,latin1

" Show special characters with double width properly
set ambiwidth=double

" Set number format. Added 'alpha' to enable alphabet increments (^A)
set nf=hex,octal,alpha

" Search highlighting
" set hlsearch
set hls

" Makes search act like search in modern browsers
set incsearch

" Set spell checker language
set spelllang=en_gb

" No join space. Prevents double space after period when joining lines.
set nojs

" Set command history
set history=500

" Automatically remove upon save: trailing whitespace, blank lines at beginning
" of file, blank lines at end of file. Avoid for diffs to avoid corrupting them.
autocmd BufWritePre *
  \ if &filetype !=# 'diff' |
  \   :%s/\s\+$//e | :%s/\n\+\%$//e | :0s/^\n\+//e |
  \ endif

" Fix backspace
set backspace=indent,eol,start


" Get rid of 'Thanks for flying Vim'
let &titleold=''

" Enable mouse
set ttymouse=xterm2
set mouse=a

" Always show status line
set laststatus=2

" set statusline=%F%m%r%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ %l:%v[%2p%%\ of\ %L]
" set statusline=%F%m%r%h%w\ %l:%v[%2p%%\ of\ %L]
set statusline=%F%m%r%h%w\ %l/%L[%2p%%]:%v
set statusline+=%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=[%{&ff}][%Y]\ \|\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}

" Avoid vim swap files and backups
set noswapfile
set nobackup
set nowritebackup

" Prevent search from wrapping at EOF
set nowrapscan

" Wrap at 80 chars by default
set textwidth=80

" Add 2 to the default format options
set formatoptions+=2

" Always use black background, regardless of color scheme
hi Normal ctermbg=black
hi LineNr ctermbg=black
hi NonText ctermbg=black

" NERDTree "
""""""""""""
" Toggle NERD tree with <Leader>n
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" Have NERD tree show hidden files by default
let NERDTreeShowHidden=1

" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use <tab> to cycle over windows
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" <C-I> ( == <tab>) now cycles windows; use <Leader>i to get original <C-I>
nnoremap <Leader>i <C-I>

" Enable fzf
set rtp+=/usr/local/opt/fzf

" Use C-p for fzf
nnoremap <C-p> :FZF<CR>

" Use <CR> to :noh
nnoremap <silent> <CR> :noh<CR><CR>

" Use <Leader>b for git blame
nnoremap <Leader>b :Gblame<CR>

" Set Airline theme
let g:airline_theme = "base16color"

" Avoid preview window during autocomplete
set completeopt-=preview

" Reduce update time (for vim-gitgutter)
set updatetime=100

" tab and space
" et:   expandtab
" sta:  smarttab
" sts:  softtabstop
" ts:   tabstop
" sw:   shiftwidth
" Expand tabs to spaces
set expandtab
" Size of the space inserted or removed with >> or <<
set shiftwidth=2
" Size of a tab
set tabstop=2
set softtabstop=2
" autocmd FileType yaml setlocal et sta sw=2 sts=2 ts=2
" autocmd FileType python setlocal et sta sw=4 sts=4 ts=4

" Reselect block after shift left/right
vnoremap < <gv
vnoremap > >gv

" Avoid showing mode on the last line
set noshowmode

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" set foldcolumn=1

" Turn backup off since most stuff is under source control
" no backup files
set nobackup
" no swap files
set noswapfile
" no undo files
set noundofile
" only in case you don't want a backup file while editing
set nowritebackup

" Set color scheme
try
    colorscheme jellybeans
    " colorscheme desert
catch
endtry

au VimLeave * if filereadable("[path here]/.netrwhist")|call delete("[path here]/.netrwhist")|endif

" git "
"""""""
" Set text width for Git commit messages
autocmd FileType gitcommit setlocal tw=72

" Turn on spell checker for Git commit messages
autocmd FileType gitcommit setlocal spell

" go "
""""""
" Disable vim-go's templates
let g:go_template_autocreate = 0

" Use goimports instead of gofmt
let g:go_fmt_command = "goimports"

" Map gr to :GoRename
nnoremap <silent> gr :GoRename<CR>

" custom key maps
nnoremap json :%! jq . <enter>
