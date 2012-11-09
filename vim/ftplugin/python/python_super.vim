function! GetCurrentPythonClass()
    call search('^\s*class ', 'sbe')
    let class = expand('<cword>')
    normal ''
    return class
endfunction

function! GetCurrentPythonMethod()
    call search('^\s*def ', 'sbe')
    let method = expand('<cword>')
    normal ''
    return method
endfunction

function! GetCurrentArgs()
    let line_number = search('^\s*def[^(]\+(self', 'sbe')
    echo line_number
    let args = matchstr(getline(line_number), '^\s*def[^(]\+(self,\s*\zs.*\ze):$')
    normal ''
    return args
endfunction
