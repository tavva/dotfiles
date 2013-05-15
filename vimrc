set nocompatible
syntax on

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

" Use pathogen to easily modify the runtime path to include all plugins
" under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin on
filetype indent on

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

" Clear search result highlighting.
nnoremap <leader><space> :noh<cr>

" Map :Ack to something quicker.
nnoremap <leader>a :Ack

" Gundo (undo visualiser - see plugin)
nnoremap <F5> :GundoToggle<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" NERDTree is ace
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

" Tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

" Change working directory to match current file
map <leader>cd :cd %:p:h<CR>:pwd<CR>

map <leader>ip oimport ipdb; ipdb.set_trace()<Esc>

set tags=~/tags

set tabpagemax=15

set autochdir

" Don't litter the working dir with swapfiles
set backupdir=.backup,/tmp,.
set directory=.backup,/tmp,.

map <F6> :FastCommit<CR>

:nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 'ra'
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
