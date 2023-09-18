
" Disable the plugin with a 0
let g:context_enabled = 1

" Black list by file type.
let g:context_filetype_blacklist = ["tex"]


" By default we create some mappings to update the context on all Vim commands which scroll the buffer.
" Set this variable to 0 to disable that. See below on how to customize these mappings if needed.
let g:context_add_mappings = 1


" By default we use this character (digraph .M) in our ellipsis (···).
" Change this variable if this character doesn't work for you or if you don't like it.
let g:context_ellipsis_char = '·'

