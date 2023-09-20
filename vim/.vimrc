"KEEPING THE REMAPS FOR THE VSCODE PLUGIN
"######################
"### MAIN CONFIG ######
"######################
set number " show line number
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch
set autoread

set cursorline
set hidden
set shiftwidth=4 " number of spaces to use for autoindenting
set splitright
set clipboard=unnamed
syntax enable

let mapleader = ","
let maplocalleader = "\\"

" disable annoying beep
set noerrorbells
set vb t_vb=

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" autocomplete
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

syntax on
set t_Co=256
set cursorline


""######################
""####### REMAPS #######
""######################

"" general
noremap ; :
inoremap jk <Esc>
inoremap JK <Esc>
nmap <C-s> :w<cr>
vmap <C-y> <cmd>'<,'>*y<cr>

"" move
nnoremap J <C-f>
nnoremap K <C-b>
nnoremap H {{
nnoremap L }}

vnoremap J <C-f>
vnoremap K <C-b>
vnoremap H {{
vnoremap L }}

"" new ones
nmap <leader>ss :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap n nzzzv
nmap N Nzzzv

"" buffer/tab control
nmap <Tab><Tab> <esc><C-w><C-w>
nmap <Tab>l <Esc>:bn<cr>
nmap <Tab>h <Esc>:bp<cr>
nmap <Tab>d <Esc>:bdelete<cr>
nmap <Tab>v <Esc>:vert<space>sbNext<cr>

"" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
