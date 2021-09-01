

" ---- vimwiki setup ----

filetype plugin on
" This is ignored
au FileType vimwiki setlocal syntax=markdown
" And the folowing causes the vimwiki to explode.
" au BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType vimwiki  setlocal syntax=markdown

" --- stup 1----
"
let g:vimwiki_list = [{
    \ 'path': '/home/r00tr4t/repos/vimwiki',
    \ 'path_html': '/home/r00tr4t/repos/vimwiki/html',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \  'index':				'README',
    \ 'custom_wiki2html': '/home/r00tr4t/repos/vimwiki/md2html.sh',
    \ 'css_file': '/home/r00tr4t/repos/vimwiki/templates/assets/css',
    \ 'template_path': '/home/r00tr4t/repos/vimwiki/templates',
    \ 'nested_syntaxes':{'python': 'python', 'sh': 'sh', 'c':   'c', 'c++': 'cpp'},
    \ 'template_default': 'index',
    \ 'template_ext': '.html'},
    \ {
    \ 'path': '~/personal-wiki/',
    \ 'path_html': '~/personal-wiki/html/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md'}]
let g:vimwiki_folding='expr'
let g:vimwiki_use_calendar=0
" let g:vimwiki_global_ext = 0
let g:vimwiki_html_header_numbering=2
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_makrdown_link_ext = 1
let g:markdown_folding = 1
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
let g:vimwiki_folding = ''
let g:taskwiki_markup_syntax = 'markdown'
" let g:vimwiki_ext2syntax = {}
" let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md':'markdown'}
" let g:vimwiki_ext2syntax = {'.md':'markdown', '.markdown':'.mdown','.wiki':'markdown',}
let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \ '.mkd': 'markdown',
            \ '.wiki': 'markdown'}


function! Vimwikifix()
    set ft=markdown
    " let g:vimwiki_folding='expr'
    " let g:vimwiki_use_calendar=0
    " " let g:vimwiki_global_ext = 0
    " let g:vimwiki_html_header_numbering=2
    " let g:vimwiki_hl_headers=1
    " let g:vimwiki_hl_cb_checked=1
    " let g:vimwiki_makrdown_link_ext = 1
    " let g:markdown_folding = 1
    " let g:taskwiki_markup_syntax = 'markdown'
    " let g:vimwiki_makrdown_link_ext = 1
    " let g:vimwiki_ext2syntax = {'.md': 'markdown',
    "         \ '.mkd': 'markdown',
    "         \ '.wiki': 'markdown'}
endfunction
autocmd FileType vimwiki map c :call Vimwikifix()
autocmd FileType vimwiki nnoremap <F12> :call Vimwikifix() <CR> " Changed FileType


" This is ignored
au FileType vimwiki setlocal syntax=markdown
" And the folowing causes the vimwiki to explode.
" au BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType vimwiki  setlocal syntax=markdown


" test 2
" let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
"           \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
"           \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
"           \ 'html_filename_parameterization': 1,
"           \ 'template_ext': '.tpl'}]


 " stup 3
 "
" let wiki_1 = {}
" let wiki_1.index = 'README'
" let wiki_1.path = '~/repos/vimwiki/'
" let wiki_1.path_html = '~/repos/vimwiki/'
" let wiki_1.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'c':   'c', 'c++': 'cpp'}
" let wiki_1.ext = '.md'
" let wiki_1.folding = 'syntax'
" let wiki_1.syntax = 'markdown'
" let g:vimwiki_list = [wiki_1]
" let g:vimwiki_global_ext = 0
