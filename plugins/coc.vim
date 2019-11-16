let g:coc_global_extensions = [
            \   'coc-html',
            \   'coc-css',
            \   'coc-json',
            \   'coc-tsserver',
            \   'coc-tslint-plugin',
            \   'coc-prettier',
            \   'coc-phpls',
            \   'coc-solargraph',
            \   'coc-stylelint'
            \ ]

nnoremap <silent> gh :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
