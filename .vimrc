"
"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
" _| |/ // // /  / / _, _/ /___   
"(_)___/___/_/  /_/_/ |_|\____/   
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
"set colorcolumn=80

set background=dark
colorscheme onedark
let g:onedark_terminal_italics = 1
" let g:gruvbox_contrast_dark='soft'
" let g:gruvbox_italic=1

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
set lazyredraw
autocmd FileType vue,javascript set shiftwidth=2

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
" m for join
noremap m J  


"************************
"* split window
"************************
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


"************************
"* file operation
"************************
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>


" Basic file system commands
nnoremap <C-t> :!touch<Space>
nnoremap <C-e> :e<Space>
nnoremap <C-d> :!mkdir<Space>
"nnoremap <C-m> :!mv<Space>%<Space>
"nnoremap <LEADER>] :bnext<CR>
"nnoremap <LEADER>[ :bprevious<CR>


"************************
"* fcitx auto switch CN/EN
"************************
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


"************************
"* something Useful
"************************
" open a terminal window
noremap <LEADER>/ :terminal<CR>
" exit terminal mode
tnoremap <LEADER><Esc> <C-\><C-n>
" to next <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

function! VimDocOfCword()
	let l:cword = expand('<cword>')
    exec ":h ".l:cword
endfunction
autocmd FileType vim nmap <leader>d :call VimDocOfCword()<CR>


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
"* last position
"************************
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        


"************************
"* quick run code
"************************
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
	elseif &filetype == 'markdown'
		"exec 'MarkdownPreviewStop'
		exec 'MarkdownPreview'
	elseif &filetype == 'vimwiki'
		"exec 'MarkdownPreviewStop'
		exec 'MarkdownPreview'
    elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
    elseif &filetype == 'processing'
		:RunProcessing
    elseif &filetype == 'html'
		:!google-chrome-stable %
    endif                                                                              
endfunc

map <F6> :call CompileGcc()<CR>
func! CompileGcc()
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
    endif                                                                              
endfunc

" debugging with gdb
map <F7> :call DebugwithGDB()<CR>
func! DebugwithGDB()
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


"************************
"* setting for neovim
"************************
autocmd FileType json syntax match Comment +\/\/.\+$+


"************************
"* Plug
"************************
call plug#begin('~/.vim/plugged')

" dress up
set termguicolors
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug '66RING/eleline.vim'
Plug 'mg979/vim-xtabline'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer'


" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode'

Plug 'dkarter/bullets.vim'
    

"" snips
"" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories= [$HOME.'/.vim/config/Ultisnips']
Plug 'tpope/vim-commentary'


" git
Plug 'airblade/vim-gitgutter'


" something useful
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' h h-> 'h h'
Plug 'easymotion/vim-easymotion'

" taglist
Plug 'liuchengxu/vista.vim'

" search selected
Plug 'bronson/vim-visual-star-search'

Plug 'junegunn/goyo.vim'  " goyo to turn on goyo! to turn off, g:goyo_  to config

" coding
" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Processing
Plug 'sophacles/vim-processing'


call plug#end()



" ____  _             _         ____       _   _   _                 
"|  _ \| |_   _  __ _(_)_ __   / ___|  ___| |_| |_(_)_ __   __ _ ___ 
"| |_) | | | | |/ _` | | '_ \  \___ \ / _ \ __| __| | '_ \ / _` / __|
"|  __/| | |_| | (_| | | | | |  ___) |  __/ |_| |_| | | | | (_| \__ \
"|_|   |_|\__,_|\__, |_|_| |_| |____/ \___|\__|\__|_|_| |_|\__, |___/
"               |___/                                      |___/     


"************************
"* coc
"************************
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
    \ 'coc-python', 'coc-java', 'coc-html',
    \ 'coc-json', 'coc-css', 'coc-yank',
    \ 'coc-tsserver', 'coc-lists', 'coc-gitignore', 'coc-git',
    \ 'coc-vimlsp', 'coc-highlight', 'coc-tailwindcss',
    \ 'coc-stylelint', 'coc-explorer', 'coc-translator', 
    \ 'coc-vetur'  
    \ ]
" npm i eslint eslint-plugin-vue -D in root workspace to use vetur

" coc statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" tab to expend
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" disable suggest for:
autocmd FileType markdown let b:coc_suggest_disable = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
nmap ts <Plug>(coc-translator-p)

" Remap for format selected region
xmap <C-s>  <Plug>(coc-format-selected)
nmap <C-s>  <Plug>(coc-format-selected)

" Coc multiple cursor 
" override the highlight of multiple cursor
"hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-w> <Plug>(coc-cursors-word)
xmap <silent> <C-w> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)


"************************
"* eleline
"************************
set laststatus=2
let g:eleline_powerline_fonts = 1


"************************
"* easymotion
"************************
let g:EasyMotion_do_mapping = 'off'
nmap ss <Plug>(easymotion-sn)


"************************
"* closetag
"************************
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.wxml,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

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
"let g:closetag_close_shortcut = '<leader>>'


"************************
"* vim-go
"************************
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_textobj_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0

au FileType go nmap <leader>d <Plug>(go-doc)
au FileType go nmap <F6>      <Plug>(go-build)
autocmd BufWritePre,FileWritePre *.go  exe "GoImports"


"************************
"* OmniSharp
"************************
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
	autocmd!
	autocmd FileType cs set signcolumn=yes
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction


"************************
"* Processing
"************************
let g:processing_no_default_mappings = 1


"************************
"* vim-commentary
"************************
autocmd FileType apache setlocal commentstring=#\ %s


"************************
"* EasyAlign
"************************
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"************************
"* markdown preview setting
"************************
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


"************************
"* bullets
"************************
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
" disable default key mapping
" let g:bullets_set_mappings = 0 "


"************************
"* xtabline
"************************
" :h xtabline.txt
let g:xtabline_settings = {}
let g:xtabline_settings.tabline_modes = ['buffers']
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.buffer_filtering = 0
let g:xtabline_settings.tab_number_in_buffers_mode = 0
"let g:xtabline_settings.last_open_first = 1
nnoremap <LEADER>] :XTabNextBuffer<CR>
nnoremap <LEADER>[ :XTabPrevBuffer<CR>
nnoremap *p :XTabPinBuffer<CR>
nmap <BS> <Plug>(XT-Select-Buffer)




"************************
"* GitGutter
"************************
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


"************************
"* Vista.vim
"************************
":Vista [EXECUTIVE]: open vista window powered by EXECUTIVE
noremap T :Vista!!<CR>
noremap <LEADER>v :silent! Vista finder<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'

