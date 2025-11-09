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
elseif has('linux')
    vmap <C-x> :!xclip -selection clipboard<CR>
    " vmap <C-c> :w !pbcopy<CR><CR>
else
    noremap YY "+y<CR>
    noremap <leader>p "+gP<CR>
    noremap XX "+x<CR>
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

"" Insert the current date using F5
" inoremap <F5> <C-R>=strftime("diary/%Y-%m-%d-%a")<CR>



" For macroing the moonlander kb : do not work, thus mapping ; to :
nnoremap ; :

" Duble hitt ; to get regular ;
noremap ;; ;

" Macro for spellchecking the last missspelled word
" press ctrl+v l in insert mode to correct the last wrongly typed word.
imap <F12> <Esc>[s1z=`]a
" Spell cheking macro binding to mappp numpad to the ctrl+k4 spell
" sugioestions.


" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType = '<tab>'


