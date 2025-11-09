
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=300
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
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
" Viewer options: One may configure the viewer either by specifying a built-in
"

"" Auco coment setup for .Xresorces
autocmd FileType xdefaults setlocal commentstring=!\ %s

"" Set spell checking on by default for the filetypes
" autocmd FileType text,markdown,latex,md setlocal spell
" Optional: Restore last language on FileType

"" Groff
autocmd BufNewFile,BufRead *.groff set spell
au BufNewFile,BufRead *.groff set filetype=groff

"" Spinx documentation
let g:syntastic_rst_checkers=['sphinx']

"" FreeCAD Macro files is python
autocmd BufNewFile,BufRead *.FCMacro set filetype=python

"*****************************************************************************
"" Custom configuration upon file types or languages
"*****************************************************************************

"" Fix consseal levels in LaTeX,,,, files.
"" With this the conceal level is changed to 0
"" in insert mode and 2 in normal mode.
augroup vimrc-tex-autocmds
    autocmd!
    autocmd InsertEnter *.tex set conceallevel=0
    autocmd InsertLeave *.tex set conceallevel=0
    " autocmd BufNewFile,BufRead *.tex set filetype=tex
    autocmd BufNewFile,BufRead *.tex set spell
augroup END

" vhdl testbench filetype
autocmd BufNewFile,BufRead *.vht set filetype=vhdl

" markdown files
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Change the tab settings for programming files
augroup vimrc-programming-tabsettings
    autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
augroup END
