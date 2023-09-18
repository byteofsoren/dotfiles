" Undotree. The undo history visualizer for VIM

" Needed for undotree
if has("persistent_undo")
   let target_path = expand('~/.vim/undotree')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

"" == Configuration ==
" Layout mode 4 is Undotree to the left and preview across bottom 15 rows
let g:undotree_WindowLayout = 4
let g:undotree_DiffpanelHeight = 15

"" == Key mapping ==
"" Show the panel
nnoremap <U> :UndotreeToggle<CR>
