let g:coc_global_extensions = [
            \   'coc-html',
            \   'coc-css',
            \   'coc-json',
            \   'coc-tsserver',
            \   'coc-eslint',
            \   'coc-tslint-plugin',
            \   'coc-prettier',
            \   'coc-phpls',
            \   'coc-solargraph',
            \   'coc-stylelint',
            \   'coc-ultisnips'
            \ ]

" Keymap
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gu <Plug>(coc-float-jump)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
vmap <silent> gas <Plug>(coc-codeaction-selected)
nmap <silent> gas <Plug>(coc-codeaction-selected)
nmap <silent> gac <Plug>(coc-codeaction)
nmap <silent> gqf <Plug>(coc-fix-current)
inoremap <silent><expr> <C-r> coc#refresh()

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
