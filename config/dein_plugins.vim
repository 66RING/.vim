" let g:dein#auto_recache = 1
let g:dein#install_max_processes = 12
let g:dein#install_progress_type = 'title'
" let g:dein#enable_notification = 1



if &compatible
  set nocompatible
endif

if &runtimepath !~# '/dein.vim'
    let s:dein_dir = '~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim'
    " Clone dein if first-time setup
    if isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        if v:shell_error
            call s:error('dein installation has failed! is git installed?')
            finish
        endif
    endif

    execute 'set runtimepath+='.substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif


"========================
" Plugins
"========================
if dein#load_state('~/.cache/nvim/dein')
    call dein#begin('~/.cache/nvim/dein')
        call dein#add('~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')
        " completion
        call dein#add('neoclide/coc.nvim', {'rev': 'release'})
        " Plug 'vn-ki/coc-clap'
        
        " dress up
        call dein#add('ryanoasis/vim-devicons')
        call dein#add('glepnir/dashboard-nvim')
        call dein#add('66RING/eleline.vim')
        call dein#add('mg979/vim-xtabline')
        " Plug 'Konfekt/FastFold'
        " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        
        " Genreal Highlighter
        call dein#add('jaxbot/semantic-highlight.vim')
        " Plug 'norcalli/nvim-colorizer.lua'
        
        
        " markdown
        call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': 'markdown', 'on_cmd': 'MarkdownPreview',  'hook_post_update': 'cd app & yarn install'  })
        call dein#add('dhruvasagar/vim-table-mode', { 'on_ft': 'markdown' })
        
        call dein#add('dkarter/bullets.vim', { 'on_ft': 'markdown' })
           
        "" snips
        "" Track the engine.
        call dein#add('honza/vim-snippets')
        call dein#add('tpope/vim-commentary')
        
        
        " git
        " call dein#add('airblade/vim-gitgutter')
        
        
        " something useful
        call dein#add('junegunn/vim-easy-align' , { 'on_map': {'n': '<Plug>(EasyAlign)'}})
        call dein#add('tpope/vim-surround') " type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
        call dein#add('easymotion/vim-easymotion', { 'on_map': {'n': '<Plug>(easymotion-sn)'}})
        call dein#add('liuchengxu/vim-clap', { 'hook_post_update': ':Clap install-binary' })
        call dein#add('Shougo/defx.nvim', { 'hook_post_update': ':UpdateRemotePlugins' })
        call dein#add('kristijanhusak/defx-icons')
        " Plug 'junegunn/goyo.vim'  " goyo to turn on goyo! to turn off, g:goyo_  to config
        call dein#add('voldikss/vim-translator', { 'on_map': {'n': '<Plug>TranslateW'}})
        
        " taglist
        call dein#add('liuchengxu/vista.vim', { 'on_cmd': ['Vista', 'Vista!', 'Vista!!']})
        
        " search selected
        call dein#add('bronson/vim-visual-star-search')
        
        
        " database
        call dein#add('tpope/vim-dadbod')
        call dein#add('kristijanhusak/vim-dadbod-ui', {'on_cmd': ['DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'] })
        
        
        " coding
        " golang
        call dein#add('fatih/vim-go', { 'on_ft': 'go', 'hook_post_update': ':GoUpdateBinaries' })
        
        " Tex
        " Plug 'lervag/vimtex'
        
        " CSharp
        call dein#add('OmniSharp/omnisharp-vim', { 'on_ft': 'cs' })
        call dein#add('ctrlpvim/ctrlp.vim' , { 'on_ft': ['cs', 'vim-plug']}) " omnisharp-vim dependency
        
        " HTML, CSS, JavaScript, PHP, JSON, etc.
        call dein#add('elzr/vim-json', { 'on_ft': 'json' })
        call dein#add('hail2u/vim-css3-syntax', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
        call dein#add('spf13/PIV', { 'on_ft' :['php', 'vim-plug'] })
        call dein#add('pangloss/vim-javascript', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
        call dein#add('yuezk/vim-js', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
        call dein#add('MaxMEllon/vim-jsx-pretty', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
        call dein#add('jelera/vim-javascript-syntax', { 'on_ft': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] })
        "Plug 'jaxbot/browserlink.vim'
        call dein#add('alvan/vim-closetag')
        call dein#add('AndrewRadev/tagalong.vim')
        
        " Python
        call dein#add('Vimjas/vim-python-pep8-indent', { 'on_ft' :['python', 'vim-plug'] })
        call dein#add('numirias/semshi', { 'hook_post_update': ':UpdateRemotePlugins', 'on_ft' :['python', 'vim-plug'] })
        " Plug 'tweekmonster/braceless.vim'
        
        " Processing
        call dein#add('sophacles/vim-processing', { 'on_ft': ['processing'] })
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
