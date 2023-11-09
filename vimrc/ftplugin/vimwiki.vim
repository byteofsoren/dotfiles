"" Autocmd rules for markcdown files.
autocmd BufEnter,BufNewFile *.md setlocal syntax=markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
au FileType vimwiki setlocal syntax=markdown
setlocal syntax=markdown
set nofoldenable

" Conceal options
set conceallevel=0
" Change conceallevel to 0 when entering Insert mode
autocmd InsertEnter * setlocal conceallevel=0

" Change it back to 1 when leaving Insert mode
autocmd InsertLeave * setlocal conceallevel=2

" Debug options
" verb set syntax?
" echom "after script executed"
" Debug options
"
" Ultisnip
if exists('did_plugin_ultisnips')
  UltiSnipsAddFiletypes markdown
endif

" let g:vimwiki_ext2syntax = {}
" let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md':'markdown'}
" let g:vimwiki_global_ext = 0
" let g:vimwiki_ext2syntax = {'.md': 'markdown',
"             \ '.mkd': 'markdown',
"             \ '.wiki': 'markdown'}
" setlocal syntax=markdown


" if expand("%:e") == 'md'
"     setlocal filetype=markdown
" endif
"
function! WrapWord()
  let l:cursor_pos = getcurpos()
  normal "ayiw
  execute "normal ciw[" . @" . "](" . @" . ".md)"
  call setpos('.', l:cursor_pos)
endfunction

function! WrapSentence()
  normal! "ay
  let l:replaced_text = substitute(@a, " ", "_", "g")
  execute "normal c[" . @a . "](" . l:replaced_text . ".md)"
endfunction

" Set key mappings only for Markdown files
autocmd FileType markdown nnoremap <buffer> <leader>wc :call WrapWord()<CR>
autocmd FileType markdown vnoremap <buffer> <leader>wc :call WrapSentence()<CR>

