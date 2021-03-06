
"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
" _| |/ // // /  / / _, _/ /___   
"(_)___/___/_/  /_/_/ |_|\____/   
"                                 
" Author: 66RING@github.com


"========================
" theme settings
"========================
" syntax on
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" autocmd ColorScheme * highlight! Cursorline cterm=bold ctermfg=black guibg=#666666
" autocmd ColorScheme * highlight! Colorcolumn cterm=bold guibg=#666666
" set background=dark " dulp in oceanic_material
" let g:onedark_terminal_italics = 1
let g:oceanic_material_transparent_background = 1
let g:colors_name="oceanic_material"
" call theme#theme_init("dark", "oceanic_material")


" netrw
let g:netrw_browsex_viewer= "setsid xdg-open" 


" shotcut configuration file
source ~/.vim/shot_cut_source/md_snippits.vim
source ~/.vim/shot_cut_source/coding_short_cut.vim


command! Vimrc :e $MYVIMRC
map s <nop>
map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>
map <Space>  <Nop>


set enc=utf8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set colorcolumn=80

set termguicolors
set number
set numberwidth=1
set relativenumber
set cursorline
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=10 
set tabstop=4
set softtabstop=4   
set shiftwidth=4    
set expandtab 
" set lazyredraw
set foldmethod=indent
set foldlevel=99
autocmd FileType json,vue,javascript,css,lua,sh,vim setlocal shiftwidth=2
let mapleader=" "

set hidden
set updatetime=100
set shortmess+=c
set display=lastline

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
noremap <silent> M :exec ":mark "nr2char(getchar())<CR>
nmap ' <Plug>(bookmarks_nvim)
noremap <C-j> 0
noremap <C-l> $
noremap <LEADER><CR> :nohlsearch<CR>


"========================
" split window
"========================
noremap sl :<C-u>set splitright<CR>:vsplit<CR>
noremap sj :<C-u>set nosplitright<CR>:vsplit<CR>
noremap si :<C-u>set nosplitbelow<CR>:split<CR>
noremap sk :<C-u>set splitbelow<CR>:split<CR>
noremap st :<C-u>set splitbelow<CR>:sp<CR>:term<CR>
"=== split screen movement===
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l
"=== split operation===
noremap s<up>    :<C-u>res-5<CR>
noremap s<down>  :<C-u>res+5<CR>
noremap s<left>  :<C-u>vertical resize+5<CR>
noremap s<right> :<C-u>vertical resize-5<CR>


"========================
" file operation
"========================
noremap S :<C-u>w<CR>
noremap Q :<C-u>q<CR>
noremap R :<C-u>source $MYVIMRC<CR>


" Basic file system commands
" nnoremap <C-d> :!mkdir<Space>-p<Space>
"nnoremap <C-m> :!mv<Space>%<Space>
"nnoremap <LEADER>] :bnext<CR>
"nnoremap <LEADER>[ :bprevious<CR>


"========================
" fcitx auto switch CN/EN
"========================
let s:input_toggle = 1
function! s:fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let s:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! s:fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && s:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let s:input_toggle = 0
   endif
endfunction

"set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call <SID>fcitx2en()
""进入插入模式
" autocmd InsertEnter * call <SID>fcitx2zh()


"========================
" something Useful
"========================
" open a terminal window
noremap <LEADER>/ :<C-u>terminal<CR>
" exit terminal mode
" tnoremap <LEADER><Esc> <C-\><C-n>
tnoremap <C-n> <C-\><C-n>
" to next <++>
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

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
nnoremap <leader>d :<C-u>call FindDoc()<CR>
func! FindDoc()
    if &filetype == 'python' 
		set nosplitbelow
		:sp
        :exec "term python -c \"help('".expand("<cword>")."')\" | cat"
    elseif &filetype == 'vim'
        :exec "h ". expand("<cword>")
    else
        " default
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
nnoremap <leader>R :<C-u>call RunCode()<CR>
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
		set splitbelow
		:sp
        exec "term processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --run"
    elseif &filetype == 'html'
		set splitbelow
		:sp
		:term google-chrome-stable %
    elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term lua %
    else
        echo "nothing to run"
    endif                                                                              
endfunc

nnoremap <leader>B :<C-u>call BuildCode()<CR>
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
		set splitbelow
		:sp
        exec "term processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --build"
    elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term luac %
    else
        echo "nothing to build"
    endif                                                                              
endfunc

" debugging with gdb
nnoremap <leader>D :<C-u>call DebugWithGDB()<CR>
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
    else
        echo "nothing to debug"
    endif                                                                              
endfunc

autocmd FileType json syntax match Comment +\/\/.\+$+


execute 'source' fnamemodify('$HOME/.vim/config/plugin_config.vim', '')
" dein.vim
execute 'source' fnamemodify('$HOME/.vim/config/dein_plugins.vim', '')
" execute 'source' fnamemodify('$HOME/.vim/config/plugins.vim', '')


