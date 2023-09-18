if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh execute '0r ~/.vim/skeletons/bash.sh' | call append(line('$') - 1, printf("# Created: %s %-18s#", substitute(system('date +%Y-%m-%d'), '\n\+$', '', ''), "")) | call append(line('$'), repeat('#', 50))
    autocmd BufNewFile main.tex 0r ~/.vim/skeletons/main.tex

    " autocmd BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py
    " autocmd BufNewFile *.cpp 0r ~/.vim/skeletons/skeleton.cpp
    " autocmd BufNewFile *.html 0r ~/.vim/skeletons/skeleton.html
    " autocmd BufNewFile *.css 0r ~/.vim/skeletons/skeleton.css
    " autocmd BufNewFile *.js 0r ~/.vim/skeletons/skeleton.js
  augroup END
endif
