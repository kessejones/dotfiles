
autocmd VimEnter * call s:test()


function! s:test()
    if !argc()
        echo "test"
    endif
endfunction
