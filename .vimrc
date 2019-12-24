" shotcut configuration file
source ~/.vim/shot_cut_source/md_snippits.vim
source ~/.vim/shot_cut_source/cpp_short_cut.vim
source ~/.vim/shot_cut_source/golang_short_cut.vim
source ~/.vim/shot_cut_source/python_short_cut.vim

set enc=utf8
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8

colorscheme badwolf
set number
set cursorline
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=15 
set tabstop=4
set softtabstop=4   
set shiftwidth=4    
set expandtab 

noremap h i
noremap H I
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap j h
noremap J 5h
noremap L 5l

"Â§çÂà∂Á≤òË¥¥Âà∞Á≥ªÁªü
noremap Y "+y
noremap P "+p

"=== split the screen===
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

"=== split operation===
map s<up> :res-5<CR>
map s<down> :res+5<CR>
map s<left> :vertical resize+5<CR>
map s<right> :vertical resize-5<CR>

" ===quick operation===
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" quick run code
map <F5> :call RunCode()<CR>
func! RunCode()
    exec "w" 
    if &filetype == 'c' 
        exec 'terminal time ./%<'
    elseif &filetype == 'cpp'
        exec 'terminal time ./%<'
    elseif &filetype == 'python'
        exec 'terminal time python %'
    elseif &filetype == 'sh'
        :!time bash %
	elseif &filetype == 'markdown'
		exec 'MarkdownPreviewStop'
		exec 'MarkdownPreview'
	elseif &filetype == 'vimwiki'
		exec 'MarkdownPreviewStop'
		exec 'MarkdownPreview'
    endif                                                                              
endfunc
" === NeoVIM ‰∏çÊîØÊåÅ:!,Âè™ÊîØÊåÅ:terminal ‰∏∫‰∫ÜÊñπ‰æøÊâÄ‰ª•ÂÖàÁºñËØëËøêË°åÂàÜÂºÄ
"   Âõ†‰∏∫‰ºöÂíåstdioÂÜ≤Á™Å,Â•ΩÂÉè
map <F6> :call CompileGcc()<CR>
func! CompileGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '! clang % -o %<'
    elseif &filetype == 'cpp'
        exec '! clang++ % -o %<'
    endif                                                                              

endfunc


"************************
"*Part: setting for neovim
"*Desc:  
"************************
autocmd FileType json syntax match Comment +\/\/.\+$+

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"************************
"*Part: markdown preview setting
"*Desc:  
"************************
"let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = ''


"************************
"*Part:golang 
"*Desc:  
"************************
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

call plug#begin('~/.vim/plugged')


"************************
"*Part: Plug
"*Desc:  
"************************
Plug 'vim-airline/vim-airline'


"************************
"*Part: markdown preview
"*Desc:  
"************************
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'


"************************
"*Part: fuzzy finder
"*Desc:  
"************************
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" snips
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories= [$HOME.'/.vim/config/Ultisnips']

" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

call plug#end()





map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>
