noremap ; :

" Mouse
set mouse=a
" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I

" Next
noremap m n
noremap M N

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y"

" Indentation
nnoremap < <<
nnoremap > >>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l
noremap qf <C-w>o

" Disable the default s key
noremap s <nop>

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj
noremap <silent> \v v$h

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set incsearch
" set wildmode=longest:full
set wildmenu
set ruler
set smarttab
set lazyredraw
set showmode

silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set directory=$HOME/.config/nvim/tmp/backup,.
set undofile
set undodir=$HOME/.config/nvim/tmp/undo,.


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'LnL7/vim-nix'
"Plug 'puremourning/vimspector'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'theniceboy/antovim' " leader s to cycle
Plug 'alvan/vim-closetag'
Plug 'tomtom/tcomment_vim'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ActivityWatch/aw-watcher-vim'
 Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'
Plug 'Mofiqul/dracula.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sbdchd/neoformat'
" Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'

call plug#end()

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula
let mapleader=" "
nnoremap <leader>init :e ~/.config/nvim/init.vim<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>


let g:netrw_browse_splet=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

noremap <leader>ut :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function! g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

noremap <leader>t :term<CR>
noremap <leader>ft :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" vimwiki 
let wiki_1 = {}
let wiki_1.path = '~/vimwiki'
let wiki_2 = {}
let wiki_2.path = '~/dev/'
let wiki_2.path_html = '~/dev/vimwiki_html'
let g:vimwiki_list = [wiki_1, wiki_2]

" ===
" === VIMSPECTOR
" ===
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Leader><F11> <Plug>VimspectorUpFrame
nmap <Leader><F12> <Plug>VimspectorDownFrame

" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>

noremap c :call CompileRunGcc()<CR>
func! CompileRunGcc()
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term
    call jobsend(b:terminal_job_id, "gcc -lcs50 -std=c99 -Wall *.c &&./*\n")
"    elseif &filetype == 'cpp'
		" set splitbelow
		" exec "!g++ -std=c++11 % -Wall -o %<"
		" :sp
		" :res -15
		" :term ./%<
	" elseif &filetype == 'cs'
	" 	set splitbelow
	" 	silent! exec "!mcs %"
	" 	:sp
	" 	:res -5
	" 	:term mono %<.exe
	" elseif &filetype == 'java'
	" 	set splitbelow
	" 	:sp
	" 	:res -5
	" 	term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	" elseif &filetype == 'markdown'
	" 	exec "InstantMarkdownPreview"
	" elseif &filetype == 'tex'
	" 	silent! exec "VimtexStop"
	" 	silent! exec "VimtexCompile"
	" elseif &filetype == 'dart'
	" 	exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
	" 	silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	" elseif &filetype == 'go'
	" 	set splitbelow
	" 	:sp
	" 	:term go run .
	endif
endfunc

"let g:antovim_definitions = extend(g:antovim_definitions, [['yes', 'no', 'maybe']])
