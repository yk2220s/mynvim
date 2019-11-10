let g:lightline = {
      \   'colorscheme': 'nord',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'percent', 'cocstatus' ],
      \                [ 'fileencoding', 'filetype' ] ]
      \   },
      \   'inactive': {
      \     'left': [ [], [ 'gitbranch', 'filename', 'modified' ] ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'percent', 'cocstatus' ],
      \                [ 'filetype' ] ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'cocstatus': 'coc#status'
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' }
      \ }

" fileformat

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

