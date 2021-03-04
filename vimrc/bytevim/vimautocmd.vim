
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************


"" VimWiki setup with auto cmd
" au BufRead,BufNewFile *.md set filetype=vimwiki
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote


"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"" Auto remov trailing white space from file when saving.
autocmd BufWritePre * %s/\s\+$//e

"" PDF with zatura
autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'open -a zathura'
let g:livepreview_previewer = 'zathura'

"" Auco coment setup for .Xresorces
autocmd FileType xdefaults setlocal commentstring=!\ %s


"" Groff
autocmd BufNewFile,BufRead *.groff set spell
au BufNewFile,BufRead *.groff set filetype=groff

"" Spinx documentation
let g:syntastic_rst_checkers=['sphinx']

"*****************************************************************************
"" Custom configs
"*****************************************************************************
"
" tex
autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.tex set spell


" vhdl testbench filetype
autocmd BufNewFile,BufRead *.vht set filetype=vhdl

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
