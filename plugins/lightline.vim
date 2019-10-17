let g:lightline = {
      \   'colorscheme': 'one',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'percent', 'cocstatus' ],
      \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'inactive': {
      \     'right': [ [ 'lineinfo' ],
      \                [ 'percent', 'cocstatus' ],
      \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'cocstatus': 'coc#status'
      \   },
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

