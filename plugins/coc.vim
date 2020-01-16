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
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
