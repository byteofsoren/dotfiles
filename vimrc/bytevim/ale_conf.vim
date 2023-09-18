" Check syntax in Vim/Neovim asynchronously and fix files,
" with Language Server Protocol (LSP) support.

" Fixers config
if exists(':ALEInfo')
    function! CheckALETools()
      " Check linter tools
      for lang in keys(g:ale_linters)
        for linter in g:ale_linters[lang]
          if empty(system('which ' . linter))
            echo 'Warning: ' . linter . ' (specified for ' . lang . ') is not installed'
          endif
        endfor
      endfor
      " Check fixer tools
      for lang in keys(g:ale_fixers)
        for fixer in g:ale_fixers[lang]
          if empty(system('which ' . fixer))
            echo 'Warning: ' . fixer. ' (specified for ' . lang . ') is not installed'
          endif
        endfor
      endfor
    endfunction
    " Settings for ale
    " Enable ALE
    let g:ale_enabled = 1

    " Enable linting only when files are saved (to prevent slow down during typing)
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 'never'

    " Set ALE to run linters and fixers in the background
    let g:ale_lint_in_insert_mode = 0

    " Enable fixing files on save
    let g:ale_fix_on_save = 1

    " Set preferred linters for Python, C/C++, BASH, and Rust
    " OBSERVE all packages like flake8, shfmt and so on needs to be installed
    let g:ale_linters = {
    \   'python': ['flake8', 'mypy'],
    \   'c': ['gcc'],
    \   'cpp': ['g++'],
    \   'sh': ['shellcheck'],
    \   'rust': ['rustc'],
    \   'markdown': ['cspell'],
    \}

    " Set preferred fixers for Python, C/C++, BASH, and Rust
    " \   'c': ['clangd'],
    " \   'cpp': ['clangd'],
    let g:ale_fixers = {
    \   'python': ['autopep8', 'isort'],
    \   'sh': ['shfmt'],
    \   'rust': ['rustfmt'],
    \}

    " Configure signs for errors and warnings
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'

    " Configure virtual text (how errors/warnings appear in the buffer)
    let g:ale_virtualtext_cursor = 1
    call CheckALETools()
else
    echoerr "Warning: Plugin ALE not found. plese comment out ale_config.vim"
endif
