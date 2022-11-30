"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Inrease a list beggining at 0 with :inc command {{
xnoremap <silent> <Leader>n :<C-U>let i=1 \| '<,'>g/^/s//\=i.'. '/ \| let i=i+1 \| nohl<CR>
" xnoremap <silent> <Leader>N
"" }}

"" Split
noremap <Leader>- :<C-u>split<CR>
noremap <Leader>\| :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" VimWiki setup
nmap <Leader>wf <Plug>VimwikiFollowLink
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink
nmap <leader>wc <Plug>VimwikiToggleListItem
nmap <leader>wd <Plug>VimwikiMakeDiaryNote
nmap <leader>wg <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>wD <Plug>VimwikiDeleteLink
nmap <Leader>ww <Plug>VimwikiIndex


"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
" nnoremap <F9> :Buffers <CR>
" nnoremap <S-F8> :sbprevious<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>
nnoremap <silent> <leader>e :Files<CR>

" jedi-vim
" let g:jedi#popup_on_dot = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "0"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#smart_auto_mappings = 0


" Temporary fix to make ultisnips load custom files cange username.
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
" let g:UltiSnipsSnippetDirectories = ['/home/soren/repos/ultisnips','/home/soren/.vim/UltiSnips','/home/soren/.vim/ultisnips','/home/soren/.vim/plugged/vim-snippets/UltiSnips',]
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>j :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>k :bn<CR>

"" Marker list
nnoremap <leader>' :Marks<CR>
" noremap <leader>w :bn<CR> # Can not use <leder> w becaue of vimwiki

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Resizing windows
" noremap <C-S-J> :vertical resize +5<cr>
" noremap <C-s-L> :vertical resize -5<cr>


"" Alternative mapping for Increasing or decreasing numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>


"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Neerd tree open/close nerly never used. use <space> e instead
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" Undo tree show
nnoremap <F5> :UndotreeToggle<CR>                           " Toggle undo pannel
:inoremap <F5> <C-R>=strftime("diary/%Y-%m-%d-%a")<CR>

" Spellcheck change language between en_us and sv with F7 and F8
nnoremap <silent> <F7> :echo ToggleSpell("en_us")<CR>			" Toggle English spell.
nnoremap <silent> <F8> :echo ToggleSpell("sv")<CR>				" Toggle Swedish spell.


" terminal emulation open terminal with <space> sh
" if g:vim_bootstrap_editor == 'nvim'
"   nnoremap <silent> <leader>sh :terminal<CR>
" else
"   nnoremap <silent> <leader>sh :VimShellCreate<CR>
" endif

" For macroing the moonlander kb : do not work, thus mapping ; to :
nnoremap ; :
" nnoremap : ; " swap : -> ;        Not needed
" vnoremap ; : " Visual mode ; -> : Not needed
" vnoremap : ; " Visual swap : -> ; Not needed

" Duble hitt ; to get regular ;
noremap ;; ;

" Macro for spellchecking the last missspelled word
" press ctrl+v l in insert mode to correct the last wrongly typed word.
imap <F12> <Esc>[s1z=`]a
" Spell cheking macro binding to mappp numpad to the ctrl+k4 spell
" sugioestions.
nnoremap <Leader><F8> [s
nnoremap <Leader><F9> ]s
nnoremap <Leader><F10> z=
" nnoremap <Leader> <F7> zg
" nnoremap <Leader> <F8> zug


" Gramarous bindings:
" let g:grammarous#hooks = {}
" function! g:grammarous#hooks.on_check(errs) abort
"     nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
"     nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
" endfunction

" function! g:grammarous#hooks.on_reset(errs) abort
"     nunmap <buffer><C-n>
"     nunmap <buffer><C-p>
" endfunction

" YCM completer setup:
let g:ycm_python_binary_path = '/usr/bin/python3'

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" let g:SuperTabDefaultCompletionType = "<c-tab>"
"
" auto close the completion window
let g:ycm_autoclose_preview_window_after_completion = 1
" only use the `Down` key to select the first item
" let g:ycm_key_list_select_completion = ['<Down>']




" Ultisnis settings
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsExpandTrigger="<cr>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"

