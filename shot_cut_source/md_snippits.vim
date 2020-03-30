autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,** ****<++><Esc>F*hi
autocmd Filetype markdown inoremap ,* **<++><Esc>F*i
autocmd Filetype markdown inoremap ,~ ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap ,` ``` <Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,{ {}<++><Esc>F}i
autocmd Filetype markdown inoremap ,( ()<++><Esc>F)i
autocmd Filetype markdown inoremap ,[ []<++><Esc>F]i
autocmd Filetype markdown inoremap ," ""<++><Esc>F"i
autocmd Filetype markdown inoremap ,' ''<++><Esc>F'i
autocmd Filetype markdown inoremap ,< <><++><Esc>F>i
autocmd Filetype markdown inoremap ,$ $$<++><Esc>F$i
autocmd Filetype markdown inoremap ,$$ $$$$<++><Esc>F$hi

autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA




