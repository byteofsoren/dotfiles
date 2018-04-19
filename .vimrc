set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"======== Vundele pagagess ===============
Plugin 'tomasr/molokai.git'                                     " Collor sheme.
Plugin 'altercation/solarized.git'                                     " Collor sheme.
Plugin 'ervandew/supertab'                                     " Super tabb for fixing ycm ultisnip problem
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'                                       " Sniplet plugin for vim
Plugin 'honza/vim-snippets'                                     " Sniplets for ultisnips
Plugin 'lervag/vimtex'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'suoto/vim-hdl'
Plugin 'tpope/vim-fugitive.git'
Plugin 'kien/ctrlp.vim'
"Plugin 'suoto/vim-hdlPlugin'
"Plugin Lokaltog/powerline'                                     " linje i botten av vim
"Plugin 'scrooloose/syntastic'
"Plugin 'dylanaraps/wal.vim'
"Plugin 'vim-scripts/octave.vim--'
"Plugin 'sudar/vim-arduino-syntax'

"========= End packages ==================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
syntax on
"filetype plugin indent     " required
" To ignore plugin indent changes, instead use:
"filetype plugin
"
" Brief help
" :PluginList       - lists cfigured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - cfirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your n-Plugin stuff after this line

" == Custom keybindings ==
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" ==================== Custom key bindings ===============================
"
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> <esc>:nohl<CR>
vnoremap <C-n> <esc>:nohl<CR>
inoremap <C-n> <esc>:nohl<CR>

" Insert a date in to a document.
:nnoremap <F3> "=strftime("%Y-%m-%d")<CR>P
:nnoremap <F4> "=strftime("%H:%M")<CR>P



" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
"vnoremap <C-Z> :update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>q :quit<CR>  " Quit current window
noremap <Leader>Q :qa!<CR>   " Quit all windows
map Q :q<CR>

" chaning supertab settings.
"

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
"

" easier moving between tabs
"map <Leader>j <esc>:tabprevious<CR>
"map <Leader>k <esc>:tabnext<CR>
"map <Leader>c <esc>:tabnew<CR>
"map <Leader>i <esc>:vsplit<CR>


" map sort function to a key
"vnoremap <Leader>s :sort<CR>

"ful fix för Whitespace på ,§
"map <leader>§ <esc>:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" taglist togle med F2>
"nnoremap <F3> :TlistToggle<CR>
"nnoremap <C-F3> :TlistShowPrototype<CR>
nnoremap <F5> :make all<CR>
"============== END Custom keybindings ==================

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au InsertLeave * match ExtraWhitespace /\s\+$/
set number background=dark
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"" color wombat256mod
colorscheme molokai
hi Comment  ctermfg=darkred
"colorscheme wal
"colorscheme zellner
""hi Visual term=reverse cterm=reverse

" Enable syntax highlighting
" You need to reload this file for the change to apply


" Showing line numbers and length
set number  " show line numbers
set relativenumber  " Sets to defaulty show relative numbers for easy navigation
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
"highlight ColorColumn ctermbg=233
set cursorline
set diffopt=vertical

" easier formatting of paragraphs
"vmap Q gq
"nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


set rtp+=/usr/lib/python3.4/site-packages/powerline_status-dev-py3.4.egg/powerline/bindings/vim

"call vam#ActivateAddons(['powerline'])
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

set nofoldenable
"" Custom collors for better visual selecting
hi Visual term=reverse cterm=reverse

" ycm_key_invoke_completion change keybinding on ycm from ctrl space to ctrl b
" let g:ycm_key_invoke_completion = '<C-b>'

" Sets spell language in LaTeX files to en_us.
autocmd FileType tex setlocal spell spelllang=en_us

" YCM completer setup:
let g:ycm_python_binary_path = '/usr/bin/python3'



" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set t_Co=256
"highlight comment    ctermfg=blue
"highlight identifier ctermfg=99AA00

" Because i use the fish shell I need to set the shell to bash
set shell=/bin/sh
" Makes vim transparent.
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic ctermbg=None ctermfg=Blue
