" VimWiki configuration file.

" au FileType vimwiki setlocal syntax=markdown
" " let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md':'markdown'}
" let g:vim_markdown_folding_disabled = 1
" let g:vimwiki_ext2syntax = {}
" let g:vimwiki_global_ext = 0

let g:vimwiki_list = [{
                    \ 'path': '/home/soren/repos/vimwiki',
                    \ 'syntax': 'markdown', 'ext': '.md'}]


" When using markdown this stops vimwiki from treating orher markdorw files as
" part of the wiki.
let g:vimwiki_global_ext = 0

" Table mappings for tab off.
let g:vimwiki_key_mappings = { 'table_mappings': 0, }

" --- Folding ---

" By setting folding you can customize the folds to be what you want.
" 'list' folds sub lists to folds.
" 'custom' use your own function to describe the fold.
let g:vimwiki_folding='list'

" Folding level for markdown # headders.
" Level 0 means no folding (Disable)
" Level 1 means folding only the first level #
" Level 2 means folding at ##
let g:markdown_folding_level = 2

" Set taskwixi to markdown
let g:taskwiki_markup_syntax = 'markdown'

" --- Highlighting ---
" Highlight headers(#) with a color
let g:vimwiki_hl_headers=1
" Highlight checked list items with a color
let g:vimwiki_hl_cb_checked=1



