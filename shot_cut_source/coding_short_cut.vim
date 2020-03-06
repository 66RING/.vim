" c, go, json, sh
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,{ {}<++><Esc>F}i
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,( ()<++><Esc>F)i
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,[ []<++><Esc>F]i
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ," ""<++><Esc>F"i
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,' ''<++><Esc>F'i
autocmd Filetype *script,java,cpp,c,go,json,sh inoremap ,< <><++><Esc>F>i



" python
autocmd Filetype python inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype python inoremap ,( ()<++><Esc>F)i
autocmd Filetype python inoremap ,[ []<++><Esc>F]i
autocmd Filetype python inoremap ," ""<++><Esc>F"i
autocmd Filetype python inoremap ,' ''<++><Esc>F'i
autocmd Filetype python inoremap ,< <><++><Esc>F>i



