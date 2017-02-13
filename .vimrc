" Sample .vimrc file by Martin Brochhaus Presented at PyCon APAC 2012

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begi('~/some/path/here')

"======== Vundele pagagess ===============
Plugin 'gmarik/Vundle.vim'                                      " let Vundle manage Vundle, required
Plugin 'tomasr/molokai.git'                                     " Collor sheme.
Plugin 'Lokaltog/powerline'                                     " linje i botten av vim
Plugin 'vim-scripts/taglist.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/syntastic'
"Plugin 'vim-scripts/octave.vim--'
"Plugin 'sudar/vim-arduino-syntax'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'                                       " Sniplet plugin for vim
Plugin 'honza/vim-snippets'                                     " Sniplets for ultisnips

"========= End packages ==================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F3>
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
" Bindings for ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"       " (Default)
"let g:UltiSnipsExpandTrigger="<c-w>"
"let g:UltiSnipsJumpForwardTrigger="<c-m>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> <esc>:nohl<CR>
vnoremap <C-n> <esc>:nohl<CR>
inoremap <C-n> <esc>:nohl<CR>


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


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
"

" easier moving between tabs
map <Leader>j <esc>:tabprevious<CR>
map <Leader>k <esc>:tabnext<CR>
map <Leader>c <esc>:tabnew<CR>
map <Leader>i <esc>:vsplit<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>

"ful fix för Whitespace på ,§
map <leader>§ <esc>:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen<CR>

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

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"" color wombat256mod
colorscheme molokai
""hi Visual term=reverse cterm=reverse

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
set cursorline


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
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


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================

" TagList settings
"let Tlist_Close_On_Select = 1 "close taglist window once we selected something
"let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
"let Tlist_Show_Menu = 1 "show Tags menu in gvim
"let Tlist_Show_One_File = 1 "show tags of only one file
"let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
"let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
"let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
"let Tlist_Use_Right_Window = 1 "display taglist window on the right
"let Tlist_Display_Prototype = 1 "display full prototype instead of just function name

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"set rtp+=~/.vim/bundle/powerline/bindings/vim
"set rtp+=/usr/lib/python3.4/site-packages/Powerline-beta-py3.4.egg/powerline/bindings/vim
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

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"set completeopt=longest,menuone
"function! OmniPopup(action)
"    if pumvisible()
"        if a:action == 'j'
"            return "\<C-N>"
"        elseif a:action == 'k'
"            return "\<C-P>"
"        endif
"    endif
"    return a:action
"endfunction

"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"pylint settings
"let g:PyLintSigns = 1
"let g:PyLintOnWrite = 1


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
"" Custom collors for better visual selecting
hi Visual term=reverse cterm=reverse

" ycm_key_invoke_completion change keybinding on ycm from ctrl space to ctrl b
" let g:ycm_key_invoke_completion = '<C-b>'



