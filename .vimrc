"
"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
" _| |/ // // /  / / _, _/ /___   
"(_)___/___/_/  /_/_/ |_|\____/   
"                                 
"
"
"

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" shotcut configuration file
source ~/.vim/shot_cut_source/md_snippits.vim
source ~/.vim/shot_cut_source/coding_short_cut.vim


map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>

set enc=utf8
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8

colorscheme gruvbox
set number
set relativenumber
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

let mapleader=" "

noremap h i
noremap H I
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap j h
noremap J 5h
noremap L 5l
noremap Y "+y
noremap P "+p

"************************
"*Part: split screen
"*Desc:  
"************************
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
"=== split screen movement===
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l
"=== split operation===
map s<up> :res-5<CR>
map s<down> :res+5<CR>
map s<left> :vertical resize+5<CR>
map s<right> :vertical resize-5<CR>


"************************
"*Part: file operation
"*Desc:  
"************************
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"" Alias replace all to S
"nnoremap S :%s//g<Left><Left>

" Basic file system commands
nnoremap <C-t> :!touch<Space>
nnoremap <C-e> :!crf<Space>
nnoremap <C-d> :!mkdir<Space>
nnoremap <C-m> :!mv<Space>%<Space>


"************************
"*Part: something Useful
"*Desc:  
"************************
" open a terminal window
noremap <LEADER>/ :terminal<CR>
" exit terminal mode
tnoremap <LEADER><Esc> <C-\><C-n>
" to next <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" Call figlet
noremap tx :r !figlet

"************************
"*Part: last position
"*Desc: Uncomment the following to have Vim jump to the last position when       
"************************
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"************************
"*Part: quick run code
"*Desc:  
"************************
map <F5> :call RunCode()<CR>
func! RunCode()
    exec "w" 
    if &filetype == 'c' 
        exec 'terminal time ./%<'
    elseif &filetype == 'cpp'
        exec 'terminal time ./%<'
    elseif &filetype == 'python'
        exec 'terminal time python %'
    elseif &filetype == 'java'
        exec 'terminal time java %'
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
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"




"************************
"*Part:golang 
"*Desc:  
"************************
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


"************************
"*Part: coc
"*Desc:  
"************************
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
    \ 'coc-python', 'coc-java', 'coc-html',
    \ 'coc-json', 'coc-css', 'coc-yank',
    \ 'coc-tsserver', 'coc-lists', 'coc-gitignore',
    \ 'coc-vimlsp', 'coc-highlight', 'coc-tailwindcss',
    \ 'coc-stylelint'
    \ ]
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <C-s>  <Plug>(coc-format-selected)
nmap <C-s>  <Plug>(coc-format-selected)


"************************
"*Part: Plug
"*Desc:  
"************************
call plug#begin('~/.vim/plugged')


"************************
"*Part: dress up
"*Desc:  
"************************
set termguicolors
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
"Plug 'vim-airline/vim-airline'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer'


"************************
"*Part: markdown
"*Desc:  
"************************
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode'

" markdown preview setting
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''


""************************
""*Part: Nerd Tree plugins
""*Desc:  
""************************
"Plug 'preservim/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
"Plug 'scrooloose/nerdcommenter'


"************************
"*Part: something useful
"*Desc:  
"************************
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'

    
"************************
"*Part: snips
"*Desc:  
"************************
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories= [$HOME.'/.vim/config/Ultisnips']


Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


"************************
"*Part: coding
"*Desc:  
"************************
" Tex
Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" emoji in vim
Plug 'junegunn/vim-emoji'


call plug#end()

" ===================== Start of Plugin Settings =====================

"************************
"*Part: eleline.vim
"*Desc:  
"************************
set laststatus=2


"************************
"*Part: closetag
"*Desc:  
"************************
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.wxml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


""************************
""*Part: NERDTree Settings
""*Desc:  
""************************
"
"nmap <C-n> :NERDTreeToggle<CR>
"
"" Close if only NERDTree is open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
"    \ "Staged"    : "#0ee375",
"    \ "Modified"  : "#d9bf91",
"    \ "Renamed"   : "#51C9FC",
"    \ "Untracked" : "#FCE77C",
"    \ "Unmerged"  : "#FC51E6",
"    \ "Dirty"     : "#FFBD61",
"    \ "Clean"     : "#87939A",
"    \ "Ignored"   : "#808080"
"    \ }
"
"
"let g:NERDTreeIgnore = ['^node_modules$']
