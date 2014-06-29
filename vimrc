set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'sjl/gundo.vim'

Bundle 'davidhalter/jedi-vim.git'

Bundle 'ervandew/supertab'
let g:SuperTabLongestHighlight=1

Bundle 'scrooloose/syntastic'
let g:syntastic_python_checkers=['pyflakes']

Bundle 'bling/vim-airline'
Bundle 'fatih/vim-go'

" call vundle#end()

filetype plugin indent on

syntax enable

" Local Settings
"===============

try
  source ~/.vimrc.local
catch
endtry

let mapleader=","

set showbreak=>>

colorscheme twilight

if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=m " no menubar
  set gfn=Monospace\ 11

  " Quick font size shifting
  map <F11> <ESC>:set gfn=Monospace\ 11<CR>
  map <F12> <ESC>:set gfn=Monospace\ 16<CR>

endif

" Show line numbers
if exists("&relativenumber")
  set relativenumber
else
  set number
endif

if exists("&colorcolumn")
  " Show a red line to prevent long lines.
  set colorcolumn=80
endif

set title

" Command completion
set wildmenu
set wildmode=list:longest,full
set showcmd

" Show position
set ruler

" Indentation...
set autoindent smartindent
autocmd FileType python set tabstop=4 shiftwidth=4|set expandtab|set softtabstop=4|set listchars=tab:>-,trail:_ list
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2|set listchars=tab:>-,trail:_ list
autocmd FileType htmldjango set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2|set listchars=tab:>-,trail:_ list
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2|set listchars=tab:>-,trail:_ list
autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2|set listchars=tab:>-,trail:_ list

autocmd BufRead,BufNewFile *.email set filetype=html
autocmd BufRead,BufNewFile *.css,*.scss set filetype=css

" Show statusbar and always show filename and row number
set statusline=%F%m%r%h%w\ row=%l\ column=%v
set laststatus=2

" Don't have cursor near top/bottom of screen
set scrolloff=5

" Pretend to be a pager
map <Space> <PageDown>

" Escape is miles away
imap jk <esc>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Search case insensitive when term has no captitals - case sensitive
" otherwise.
set ignorecase
set smartcase

" Tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

" Tags and tag navigation
set tags=~/tags
map <leader>] :tnext<CR>

set tabpagemax=15

set autochdir

" Don't litter the working dir with swapfiles
set backupdir=.backup,/tmp,.
set directory=.backup,/tmp,.

map <F6> :FastCommit<CR>

nnoremap <F3> :<C-u>GundoToggle<CR>
nnoremap <F4> :yss

:nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T

map <leader>ip oimport ipdb; ipdb.set_trace()<Esc>

" Reflow
function! ReflowArgs (text)
    let mx = '^\( *\)\(.*\)(\(.*\))$'
    let l = matchstr(a:text, mx)

    let spacing = substitute(l, mx, '\1', '')
    let fname = substitute(l, mx, '\2', '')
    let params_raw = substitute(substitute(l, mx, '\3', ''), ' ', '', 'g')

    let params = join(map(split(params_raw, ","), 'spacing . "    " . v:val . ","'), "\r")

    return spacing . fname . "(\r" . params . "\r" . spacing . ")"
endfunction

nnoremap <leader>s :.,.s/.*/\=ReflowArgs(submatch(0))/g<CR>:noh<CR>

" Command line mode
"===============

" zsh like shortcuts
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-b> <s-left>
cnoremap <c-w> <s-right>
