set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

au BufRead,BufNewFile *.email	setfiletype html

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

map <leader>ip oimport ipdb; ipdb.set_trace()<Esc>

set tags=~/tags

let g:pydiction_location = '/home/ben/.vim/bundle/pydiction-1.2/complete-dict'

set tabpagemax=15

set autochdir

" Don't litter the working dir with swapfiles
set backupdir=.backup,/tmp,.
set directory=.backup,/tmp,.

map <F6> :FastCommit<CR>

nnoremap <F3> :<C-u>GundoToggle<CR>
nnoremap <F4> :yss

:nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T

" Command line mode
"===============

" zsh like shortcuts
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-b> <s-left>
cnoremap <c-w> <s-right>
