" Autocmd rules for markcdown files.
autocmd BufEnter *.md setlocal syntax=markdown
au FileType vimwiki setlocal syntax=markdown
setlocal syntax=markdown

" Debug options
verb set syntax?
echom "after script executed"
" Debug options

" let g:vimwiki_ext2syntax = {}
" let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md':'markdown'}
" let g:vimwiki_global_ext = 0
" let g:vimwiki_ext2syntax = {'.md': 'markdown',
"             \ '.mkd': 'markdown',
"             \ '.wiki': 'markdown'}
setlocal syntax=markdown
