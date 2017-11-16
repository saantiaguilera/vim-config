"
" What do I need before installing this vimrc?
" - Mustang color scheme (google it)
" - the_silver_searcher (google it)
"

let mapleader=","

" Set if tmux exists to 256 color
if exists('$TMUX')
  set term=screen-256color
endif

" Map the paste toggle to F2
set pastetoggle=<F2>

" Search with ignorecase
set ignorecase
set smartcase

" Highlight search results
set hlsearch
set incsearch

" Set font
if has("mac") || has("macunix")
  set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
  set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
  set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
  set gfn=Monospace\ 11
endif

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark

" Show matching brackets
set showmatch

" Make backspace to be a backspace ffs
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Cursor blink time
set mat=2

" Remove sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Enable highlight of syntax
syntax enable

try
  colorscheme mustang
catch
endtry

set encoding=utf8
set ffs=unix,dos,mac

set wildmenu
set lazyredraw

" Make escape by pressing pattern
inoremap zz <esc>

" Set tmux cursor change
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Files
set nobackup
set nowb
set noswapfile
filetype indent on 

set expandtab
set smarttab
set shiftwidth=2 " Bitch please
set tabstop=2 " Mate...
set expandtab
set softtabstop=2

set lbr
set tw=400
set ai
set si
set wrap

" Bind ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Commands
map <space> /
map <c-space> ?
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Stay in the last edit position when returning to a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Status line
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction


function! GitBranch()
  try
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  catch
    return "NaN"
  endtry
endfunction

set laststatus=2
set statusline=%{HasPaste()}\ \ FILE:\ %F%m%r%h\ %w\ -\ \ CWD:\ %r%{getcwd()}%h%=Branch:\ %{GitBranch()}\ \ \ %l:%c:%p%%\ \ \ 

" Show the current position
set ruler

" Show the cursor line highlighted
set cursorline

" Set cmd height
set cmdheight=2

" Set buffer to hide when abandoned
set hid

" Lines for the cursor to move window
set so=10

" Set history lines to remember
set history=1000

" Set autoread
set autoread

" :W make it save with sudo
command W w !sudo tee % >/dev/null

set mouse=a
