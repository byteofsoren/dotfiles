
" let g:vimtex_compiler_method = 'latexrun'
" let g:vimtex_compiler_method = 'tectonic'
" let g:vimtex_compiler_latexmk = {'callback' : 0}

let g:vimtex_compiler_latexmk = {
  \ 'executable' : 'latexmk',
  \ 'options' : [
  \   '-pdf',
  \   '-pdflatex="pdflatex -shell-escape -synctex=1 -interaction=nonstopmode"',
  \ ],
  \}


" Turn of latex calback to avoid error as an alternative to the remote server
" let g:syntastic_tex_checkers = ['lacheck']

" Add flavor to vim-tex
" let g:tex_flavor = 'latex'
" Disable custom warnings based on regexp
" let g:qf_auto_open_quickfix = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Marginpar on page',
      \ 'unmatched',
      \ 'unmatched "beginning',
      \]

" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\\"

"Tex conseal turn off because its anoiying
" let g:tex_conceal = ''
" let g:vimtex_syntax_conceal_default = 0
" let g:vimtex_syntax_conceal = { 'accents' : 1 }
" let g:vimtex_syntax_conceal = []
