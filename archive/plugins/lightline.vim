let g:lightline = {
    \   'colorscheme': 'nord',
    \   'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent', 'cocstatus' ],
    \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \   },
    \   'inactive': {
    \     'left': [ [], [ 'gitbranch', 'filename', 'modified' ] ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent', 'cocstatus' ],
    \                [ 'filetype' ] ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'LightlineFugitive',
    \     'cocstatus': 'coc#status',
    \     'fileencoding': 'LightlineFileencoding',
    \     'fileformat': 'LightlineFileformat',
    \     'filename': 'LightlineFilename',
    \     'filetype': 'LightlineFiletype',
    \     'mode': 'LightlineMode',
    \     'percent': 'LightlinePercent',
    \   },
    \   'separator': { 'left': '', 'right': '' },
    \   'subseparator': { 'left': '', 'right': '' }
    \ }

" fileformat

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Custom component
function! LightlineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
    else
        return ''
    endif
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFilename()
    " including relative path
    return expand('%')
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    return winwidth(0) > 10 ? lightline#mode() : ''
endfunction

function! LightlinePercent()
    return winwidth(0) > 70 ? (100 * line('.') / line('$')) . '%' : ''
endfunction
