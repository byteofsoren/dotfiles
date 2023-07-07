if has("autocmd")
  augroup templates
    " autocmd BufNewFile *.sh execute '0r ~/.vim/templates/bash.sh' | execute "normal Go"  | call append(line('$'), "# Created: ".system('date +%Y-%m-%d')." #")
    autocmd BufNewFile *.sh execute '0r ~/.vim/templates/bash.sh' | execute "normal Go" | call append(line('$'), repeat('#', 50)) | call append(line('$'), printf("# Created: %s %-18s#", system('date +%Y-%m-%d'), "")) | call append(line('$'), repeat('#', 50))
    " autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    " autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
    " autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    " autocmd BufNewFile *.css 0r ~/.vim/templates/skeleton.css
    " autocmd BufNewFile *.js 0r ~/.vim/templates/skeleton.js
  augroup END
endif
