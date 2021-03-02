" ============================================================
" Config file for other settings that isn't a autocmd or functions.
" ============================================================

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']


" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Vim sever names set
"if empty(v:servername) && exists('*remote_startserver')
"    call remote_startserver('VIM')
"endif

" Turn of latex calback to avoid error as an alternative to the remote server
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:syntastic_tex_checkers = ['lacheck']

" Add flavor to vim-tex
let g:tex_flavor = 'latex'

" Color setups
" hi Conceal guibg=Blue guifg=White
let g:tex_conceal="sabgm"

" Makes vim transparent.
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic ctermbg=None ctermfg=Blue

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" "" Include user's local vim config
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite



" -----------------------------------------------------------
" ctags extra tagfile for Linux kernel
"":set tags+=~/linux-4.20-rc4/.linux-4.20-rc4
"":set tags+=tags
let g:ycm_collect_identifiers_from_tags_files = 1
" -----------------------------------------------------------
