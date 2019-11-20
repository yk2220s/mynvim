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
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <silent> gd <Plug>(coc-definition)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
