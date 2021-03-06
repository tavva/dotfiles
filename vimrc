set nocompatible
filetype off
let mapleader=","

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'docunext/closetag.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/python.vim'
Plugin 'mxw/vim-jsx.git'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'junegunn/fzf'
Plugin 'ConradIrwin/vim-bracketed-paste'

Plugin 'Twinside/vim-hoogle'
au BufNewFile,BufRead *.hs map <buffer> <F1> :Hoogle 
au BufNewFile,BufRead *.hs map <buffer> <C-F1> :HoogleClose<CR>
au BufNewFile,BufRead *.hs map <buffer> <S-F1> :HoogleLine<CR>

Plugin 'ntpeters/vim-better-whitespace'
let g:better_whitespace_filetypes_blacklist=['mail']

Plugin 'inside/vim-search-pulse'
let g:vim_search_pulse_mode = 'pattern'

Plugin 'kien/rainbow_parentheses.vim'
nnoremap <leader>b :RainbowParenthesesToggle <CR>

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0
nmap <leader>f <Plug>(easymotion-bd-w)

Plugin 'davidhalter/jedi-vim.git'
Plugin 'ervandew/supertab'
let g:SuperTabLongestHighlight=1

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['pyflakes']

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'bling/vim-airline'
let g:airline_section_c ="%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" call vundle#end()

filetype plugin indent on

syntax enable

Plugin 'vim-scripts/twilight'
colorscheme twilight

" Local Settings
"===============

try
  source ~/.vimrc.local
catch
endtry

set showbreak=>>

if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=m " no menubar
  set gfn=Droid\ Sans\ Mono\ 14

  " Quick font size shifting
  map <F11> <ESC>:set gfn=Droid\ Sans\ Mono\ 11<CR>
  map <F12> <ESC>:set gfn=Droid\ Sans\ Mono\ 14<CR>

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

" Automatic reloading
autocmd! bufwritepost .vimrc source %

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

" Search highlighting (and muting)
set hlsearch
nnoremap <silent> <leader><space> :<C-u>nohlsearch<CR><C-l>

" Tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

map <leader>, :tabnew 

" Tags and tag navigation
set tags=~/tags
map <leader>] :tnext<CR>

set tabpagemax=50

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

map <leader>' :%s:’:':g<CR>

" Command line mode
"===============

" zsh like shortcuts
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-b> <s-left>
cnoremap <c-w> <s-right>

map <c-p> :FZF ~/styleme/<cr>
map <c-l> :FZF ~/dream/<cr>

map <leader>u VypVr=
