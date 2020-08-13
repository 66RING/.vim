"
"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
" _| |/ // // /  / / _, _/ /___   
"(_)___/___/_/  /_/_/ |_|\____/   
"                                 
" Author: 66RING@github.com

let g:custom_vim_status_icon = {"n": "😏 ","V":"😏 ","v":"😏 ","\<C-v>": "😏 ","i":"😈 ","R":"🧐 ","s":"🧐 ","t":"🤨 ","c":"😈 ","!":"SE"}


" netrw
let g:netrw_browsex_viewer= "setsid xdg-open" 


" shotcut configuration file
source ~/.vim/shot_cut_source/md_snippits.vim
source ~/.vim/shot_cut_source/coding_short_cut.vim


map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>


set enc=utf8
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8
" set colorcolumn=80

set termguicolors
set background=dark
colorscheme onedark
" let g:onedark_terminal_italics = 1
" disable background color
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" autocmd ColorScheme * highlight! Cursorline cterm=bold ctermfg=black guibg=#666666
" autocmd ColorScheme * highlight! Colorcolumn cterm=bold guibg=#666666

syntax on
set number
set numberwidth=3
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
set lazyredraw
autocmd FileType vue,javascript,css setlocal shiftwidth=2

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
" :[range]y[ank] [x]
nnoremap yY :%y+<CR> 
noremap P "+p
" m for join
noremap m J  
noremap <C-j> 0
noremap <C-l> $


"========================
" split window
"========================
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map st :set splitbelow<CR>:sp<CR>:term<CR>
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


"========================
" file operation
"========================
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>


" Basic file system commands
" nnoremap <C-d> :!mkdir<Space>-p<Space>
"nnoremap <C-m> :!mv<Space>%<Space>
"nnoremap <LEADER>] :bnext<CR>
"nnoremap <LEADER>[ :bprevious<CR>


"========================
" fcitx auto switch CN/EN
"========================
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

"set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
""进入插入模式
"autocmd InsertEnter * call Fcitx2zh()


"========================
" something Useful
"========================
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


"========================
" find doc
"========================
nmap <leader>d :call FindDoc()<CR>
func! FindDoc()
    if &filetype == 'python' 
		set nosplitbelow
		:sp
        :exec "term python -c \"help('".expand("<cword>")."')\" | cat"
    elseif &filetype == 'vim'
        :exec "h ". expand("<cword>")
    endif                                                                              
endfunc


"========================
" last position
"========================
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        


"========================
" quick run code
"========================
map <F5> :call RunCode()<CR>
func! RunCode()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        :term ./%<
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        :term ./%<
    elseif &filetype == 'python'
		set splitbelow
		:sp
        :term python %
    elseif &filetype == 'java'
		set splitbelow
		:sp
        :term java %<
    elseif &filetype == 'sh'
		set splitbelow
		:sp
        :term bash %
    elseif &filetype == 'vim'
        :source %
	elseif &filetype == 'markdown'
		exec 'MarkdownPreview'
	elseif &filetype == 'vimwiki'
		exec 'MarkdownPreview'
    elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
    elseif &filetype == 'processing'
        exec "!processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --run"
    elseif &filetype == 'html'
		:!google-chrome-stable %
    elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term lua %
    endif                                                                              
endfunc

map <F6> :call BuildCode()<CR>
func! BuildCode()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        :term gcc -g % -o %<
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        :term g++ -g % -o %<
    elseif &filetype == 'java'
		set splitbelow
		:sp
        :term javac %
    elseif &filetype == 'typescript'
		set splitbelow
		:sp
        :term tsc %
    elseif &filetype == 'processing'
        exec "!processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --build"
    endif                                                                              
endfunc

" debugging with gdb
map <F7> :call DebugWithGDB()<CR>
func! DebugWithGDB()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        :term gdb %<
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        :term gdb %<
    endif                                                                              
endfunc


"========================
" setting for neovim
"========================
autocmd FileType json syntax match Comment +\/\/.\+$+


execute 'source' fnamemodify('$HOME/.vim/config/plugins.vim', '')
execute 'source' fnamemodify('$HOME/.vim/config/plugin_config.vim', '')
