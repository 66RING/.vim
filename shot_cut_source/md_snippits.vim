autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,** <Space>**** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,* <Space>** <++><Esc>F*i
autocmd Filetype markdown inoremap ,~ <Space>~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,` ``` <Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,} {}<++><Esc>F}i
autocmd Filetype markdown inoremap ,) ()<++><Esc>F)i
autocmd Filetype markdown inoremap ,] []<++><Esc>F]i
autocmd Filetype markdown inoremap ,{ {}<++><Esc>F}i
autocmd Filetype markdown inoremap ,( ()<++><Esc>F)i
autocmd Filetype markdown inoremap ,[ []<++><Esc>F]i
autocmd Filetype markdown inoremap ," ""<++><Esc>F"i
autocmd Filetype markdown inoremap ,' ''<++><Esc>F'i
autocmd Filetype markdown inoremap ,< <><++><Esc>F>i
autocmd Filetype markdown inoremap ,$ $$<++><Esc>F$i
autocmd Filetype markdown inoremap ,$$ $$$$<++><Esc>F$hi

autocmd Filetype markdown inoremap ,l [](<++>)<++><Esc>F]i

autocmd Filetype markdown inoremap <buffer> ,1 #<Space>
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space>
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space>
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space>
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space>




