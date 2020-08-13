"========================
" Plugins
"========================
call plug#begin('~/.vim/plugged')

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" dress up
Plug 'ryanoasis/vim-devicons'
Plug 'hardcoreplayers/dashboard-nvim'
Plug '66RING/eleline.vim'
Plug 'mg979/vim-xtabline'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
" Plug 'norcalli/nvim-colorizer.lua'


" markdown
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'on': 'MarkdownPreview',  'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }

Plug 'dkarter/bullets.vim', { 'for': 'markdown' }
   

"" snips
"" Track the engine.
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'


" git
Plug 'airblade/vim-gitgutter'


" something useful
Plug 'junegunn/vim-easy-align' , { 'on': ['<Plug>(EasyAlign)']}
Plug 'tpope/vim-surround' " type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-sn)']}
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'History', 'Buffers',  'Commands']}
" Plug 'junegunn/goyo.vim'  " goyo to turn on goyo! to turn off, g:goyo_  to config
Plug 'voldikss/vim-translator', { 'on': ['<Plug>TranslateW', '<Plug>TranslateWV']}

" taglist
Plug 'liuchengxu/vista.vim', { 'on': ['Vista', 'Vista!', 'Vista!!']}

" search selected
Plug 'bronson/vim-visual-star-search'


" database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui', {'on': ['DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'] }


" coding
" golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" Tex
" Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" Plug 'tweekmonster/braceless.vim'

call plug#end()






"let g:dein#auto_recache = 1

"if &compatible
"  set nocompatible
"endif
"" Add the dein installation directory into runtimepath
"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

"if dein#load_state('~/.cache/dein')
"  call dein#begin('~/.cache/dein')


"    " dress up
"    call dein#add('ryanoasis/vim-devicons')
"    call dein#add('hardcoreplayers/dashboard-nvim')
"    call dein#add('66RING/eleline.vim')
"    call dein#add('mg979/vim-xtabline')

"    " Genreal Highlighter
"    call dein#add('jaxbot/semantic-highlight.vim')
"    call dein#add('chrisbra/Colorizer')


"    " markdown
"    call dein#add('iamcco/markdown-preview.nvim', { 'on_df': 'markdown', 'build': 'cd app & yarn install' })
"    call dein#add('dhruvasagar/vim-table-mode')

"    call dein#add('dkarter/bullets.vim')
       

"    "" snips
"    "" Track the engine.
"    call dein#add('honza/vim-snippets')
"    call dein#add('tpope/vim-commentary')


"    " git
"    call dein#add('airblade/vim-gitgutter')


"    " something useful
"    call dein#add('junegunn/vim-easy-align')
"    call dein#add('neoclide/coc.nvim', {'rev': 'release'})
"    call dein#add('tpope/vim-surround') " type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
"    call dein#add('easymotion/vim-easymotion')
"    call dein#add('junegunn/fzf.vim')
"    call dein#add('voldikss/vim-translator')

"    " taglist
"    call dein#add('liuchengxu/vista.vim')

"    " search selected
"    call dein#add('bronson/vim-visual-star-search')


"    " database
"    call dein#add('tpope/vim-dadbod')
"    call dein#add('kristijanhusak/vim-dadbod-ui')


"    " coding
"    " golang
"    call dein#add('fatih/vim-go', { 'on_fd': 'go', 'build': ':GoUpdateBinaries' })


"    " CSharp
"    call dein#add('OmniSharp/omnisharp-vim', { 'on_ft': 'cs' })
"    call dein#add('ctrlpvim/ctrlp.vim' , { 'on_ft': ['cs', 'vim-plug'] }) " omnisharp-vim dependency

"    " HTML, CSS, JavaScript, PHP, JSON, etc.
"    call dein#add('elzr/vim-json', { 'on_ft': 'json' })
"    call dein#add('hail2u/vim-css3-syntax', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
"    call dein#add('spf13/PIV', { 'on_ft' :['php', 'vim-plug'] })
"    call dein#add('pangloss/vim-javascript', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
"    call dein#add('yuezk/vim-js', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
"    call dein#add('MaxMEllon/vim-jsx-pretty', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
"    call dein#add('jelera/vim-javascript-syntax', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
"    "call dein#add('jaxbot/browserlink.vim'
"    call dein#add('alvan/vim-closetag')
"    call dein#add('AndrewRadev/tagalong.vim')

"    " Python
"    call dein#add('Vimjas/vim-python-pep8-indent', { 'on_ft' :['python', 'vim-plug'] })
"    call dein#add('numirias/semshi', { 'build': ':UpdateRemotePlugins', 'on_ft' :['python', 'vim-plug'] })





"  call dein#end()
"  call dein#save_state()
"endif

"filetype plugin indent on
"if has('vim_starting')
"    syntax enable
"endif

"" Trigger source event hooks
"call dein#call_hook('source')
"call dein#call_hook('post_source')

