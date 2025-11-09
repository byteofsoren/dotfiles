" Language tool functions to switch language.
" File: vimmappings.vim contain the mappings to activate the functions

" Define a global variable to track the last language (default to English)
if !exists('g:last_language')
    let g:last_language = 'en'
endif

" Function to set English
function! SetEnglish()
    setlocal spell
    setlocal spelllang=en
    let g:languagetool_lang='en-US'
    let g:last_language='en'
    echo "Switched to English"
endfunction

" Function to set Swedish
function! SetSwedish()
    setlocal spell
    setlocal spelllang=sv
    let g:languagetool_lang='sv-SE'
    let g:last_language='sv'
    echo "Switched to Swedish"
endfunction

function! SwapLang()
    if g:last_language == 'en'
        call SetSwedish()
    else
        call SetEnglish()
    endif
endfunction

" Key map F7 changes or sets the langage.
nnoremap <F7> :call SwapLang()<CR>

" Auto command
" autocmd FileType text,markdown,latex,md if g:last_language == 'en' | call SetEnglish() | else | call SetSwedish() | endif
autocmd FileType text,markdown,latex,md call SwapLang()
