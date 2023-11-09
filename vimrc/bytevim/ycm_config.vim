" YouCompleteMe(YCM) A code-completion engine for Vim.
augroup ycm_ft_maps
    autocmd!
    autocmd FileType c,cpp,objc,objcpp,cuda,cs,go,java,javascript,python,rust,typescript  nnoremap <leader>yfg <Plug>(GoTo)
    autocmd FileType c,cpp,objc,objcpp,cuda,cs,java,javascript,python,typescript nnoremap <leader>ygg <Plug>(GoToSymbol) <CR>
augroup END

" -----------------------------------------------------------
" == ctags extra tagfile for Linux kernel ===
"":set tags+=~/linux-4.20-rc4/.linux-4.20-rc4
set tags+=tags
let g:ycm_collect_identifiers_from_tags_files = 1
" -----------------------------------------------------------

" --- ycm configurations for cland if needed: ------
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0  " <<< Inpacts preformence on vim
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
" let g:ycm_clangd_args = ['-log=verbose', '-pretty', '-query-driver=/usr/bin/west']
" let g:ycm_clangd_args = ['-log=verbose', '-pretty', '-query-driver=/usr/bin/clang++']
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
"" Give path to the python binary
let g:ycm_python_binary_path = '/usr/bin/python3'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

"" YouCompleteMe settings
highlight YcmErrorLine guibg=#3f0000

" == YouCompleteMe key bindings ==
" <space>yfw to find the symbol in the workspace and yfd symbol in the current document.
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>ygd :YcmCompleter GoToDefinition <CR>

