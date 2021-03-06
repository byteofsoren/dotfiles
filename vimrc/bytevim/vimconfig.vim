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


" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Remove the unwanted space problem in latex
let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }

" -----------------------------------------------------------
" == ctags extra tagfile for Linux kernel ===
"":set tags+=~/linux-4.20-rc4/.linux-4.20-rc4
"":set tags+=tags
let g:ycm_collect_identifiers_from_tags_files = 1
" -----------------------------------------------------------

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif



" VimWiki fix.
" au FileType vimwiki setlocal syntax=markdown
" " let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md':'markdown'}
" let g:vim_markdown_folding_disabled = 1
let g:vimwiki_ext2syntax = {}
let g:vimwiki_global_ext = 0

