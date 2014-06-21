set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'sjl/gundo.vim'
Bundle 'Shougo/neocomplcache.vim'

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

"" == Autocompletion ==

let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" == End Autocompletion ==


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

map <leader>ip oimport ipdb; ipdb.set_trace()<Esc>

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

" Command line mode
"===============

" zsh like shortcuts
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-b> <s-left>
cnoremap <c-w> <s-right>

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
