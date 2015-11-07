" ============================================
" Shit son, I hope this .vimrc file is great!
" ============================================

" Automatic reloading of .vimrc

autocmd! bufwritepost .vimrc source %

" Treat .md & similar files as markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w
" + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Enable UTF-8
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8                     " better default than latin1
	setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

" Show trailing whitespaces

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Show whitespaces

set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
set list

" Initialize vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32") || has("win16")
	set rtp+=~/vimfiles/bundle/Vundle.vim
	call vundle#begin('~/vimfiles/')
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" Let Vundler handle itself
Plugin 'gmarik/Vundle'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'eparreno/vim-l9'
Plugin 'FuzzyFinder'
Plugin 'fatih/vim-go'
Plugin 'sotte/presenting.vim'
" Colorschemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()

set laststatus=2
" Fix airline issues

let g:airline_powerline_fonts = 1

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" Sets how many lines of history VIM has to remember

set history=700
set undolevels=700

" Enable filetype plugins
filetype on
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Just enable 256 globally
set t_Co=256

colorscheme wombat256
set background=dark

set guifont=DejaVu_Sans_Mono_for_Powerline:h12

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

if !empty($CONEMUBUILD)
	set term=pcansi
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"" set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 79 characters
set lbr
set tw=79

" Line numbering
set number

set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

" Showing line numbers and length

set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" ====================
" TypeScript
" ====================
" set runtimepath+=~/vimfiles/bundle/typescript-vim/

let g:typescript_compiler_options = '--sourcemap --module commonjs'

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" ====================
" JSHint
" ====================

" set runtimepath+=~/vimfiles/bundle/jshint2.vim/

" ====================
" Fuzzyfinder (needs L9)
" ====================

" set runtimepath+=~/vimfiles/L9/
" set runtimepath+=~/vimfiles/fuzzyfinder/
command FUF FufFile

" ====================
" Aliases
" ====================

command NT NERDTreeToggle

