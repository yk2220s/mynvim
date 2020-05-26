let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'

let g:go_doc_keywordprg_enabled = 0
let g:go_addtags_transform = "camelcase"

let g:go_info_mode='gopls'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_metalinter_enabled = []
let g:go_metalinter_autosave_enabled = []
let g:go_metalinter_autosave = 1

autocmd FileType go nmap <Leader>at :<C-u>GoAddTags<CR>
autocmd FileType go nmap <Leader>t  :<C-u>GoTest!<CR>
autocmd FileType go nmap <Leader>d  :<C-u>GoDef<CR>
autocmd FileType go nmap <Leader>p  :<C-u>GoDefPop<CR>
autocmd FileType go nmap <Leader>i  :<C-u>GoImports<CR>
autocmd FileType go nmap <Leader>f  :<C-u>GoFillStruct<CR>
autocmd FileType go nmap <Leader>r  :<C-u>GoRun<CR>
