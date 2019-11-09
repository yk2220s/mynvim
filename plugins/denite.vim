" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

nnoremap [denite] <Nop>
call denite#custom#option('default', 'prompt', '>')

" display
autocmd FileType denite set winblend=15
autocmd FileType denite hi deniteSource_grepFile guifg=#8FBCBB
autocmd FileType denite hi deniteSource_grepLineNR guifg=#8FBCBB
autocmd FileType denite hi deniteGrepPatterns guifg=#EBCB9B guibg=#2E3440
" autocmd FileType denite hi deniteMatchedChar guifg=#EBCB9B
" deniteInput    xxx links to ModeMsg
" deniteMatchedRange xxx links to Underlined
" deniteMatchedChar xxx links to Search
" deniteStatusLinePath xxx links to Comment
" deniteStatusLineNumber xxx links to LineNr
" deniteSelectedLine xxx links to Statement
" deniteConcealedMark xxx cleared
" deniteSourceLine_grep xxx links to Type
" deniteSource_grep xxx cleared
" deniteSource_grepHeader xxx cleared
" deniteGrepPatterns xxx links to Function
" DeniteFilter   xxx cleared

" use floating
let s:denite_win_width_percent = 0.75
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '/ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

" Ag command on grep file/rec
call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Dgrep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').' grep -path='.a:1)
  else
    execute(':Denite -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction

" Dfile
command! -nargs=? Dfile call s:Dfile(<f-args>)
function s:Dfile(...)
  if a:0 > 0
    execute(':Denite '.join(s:denite_option_array, ' ').' file/rec -path='.a:1)
  else
    execute(':Denite '.join(s:denite_option_array, ' ').' file/rec')
  endif
endfunction
