" vim-bootstrap 2020-12-29 17:44:47

"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = "c"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim
let g:vim_bootstrap_frams = ""

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse


if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}


"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()
" Required:
filetype plugin indent on

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab


"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
set ruler
set number relativenumber

" ale
let g:ale_linters = {}
map <leader>at : ALEToggle<CR>

"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Remaping emmet trigger key
let g:user_emmet_leader_key='<C-e>'

" vim-airline
let g:airline_powerline_fonts  = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = '' 
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


" set cursorline
highlight LineNr ctermfg=240 ctermbg=NONE
highlight CursorLineNr ctermfg=8
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let var = "NONE"
execute "highlight! ALESignColumnWithErrors ctermfg=".var." ctermbg=".var
execute "highlight! ALESignColumnWithoutErrors ctermfg=".var." ctermbg=".var
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" highlight ALEWarning ctermfg=0
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight ALEErrorSign ctermfg=9
highlight ALEWarningSign ctermfg=11

" Program runner key 

" For running javascript code via node 
autocmd vimEnter *.js map <F7> :w <CR> :!clear ; node % <CR>

" For running javascript code via node 
autocmd vimEnter *.js map <F8> :w <CR> :!clear ; node % < input <CR>

" Runnig C++ program from vim 

" autocmd BufNewFile *.cpp 0r ~/template/temp.cpp
autocmd BufWinEnter *.cpp call cursor(18, 5)
" autocmd BufWinEnter *.cpp 
"
" autocmd vimEnter *.cpp map <F8> :ALEToggle <bar> :w <CR>:execute ":!clear ; g++ -Wall -Wextra -Wshadow -fsanitize=undefined -std=c++17 %; if [ -f a.out ]; then time ./a.out; sudo rm a.out; fi"<bar> :ALEToggle<CR>



autocmd vimEnter *.cpp map <F8> :ALEToggle <bar> :w <CR>:execute "!~/.script/cpp_runner.sh %" <bar> :ALEToggle<CR>


" autocmd vimEnter *.cpp map <F8> :ALEToggle <bar> :w <CR>:execute "!xterm -e 'g++ ~/test.cpp; time ./a.out; read'"<bar> :ALEToggle<CR>


" For running bash script
autocmd vimEnter *.sh map <F8> :w <bar> :!clear ; time bash % <CR>
autocmd vimEnter *.m map <F8> :w <bar> :!clear ; octave % <CR>



" For c autocmd vimEnter *.c map <F8> :w <CR>:!clear; gcc %; if [ -f a.out ]; then time ./a.out; rm a.out; fi<CR> autocmd vimEnter *.js map <F8> :w <CR>:!clear; node % < input <CR>
autocmd vimEnter *.py map <F8> :w <CR>:!clear; python %<CR>
autocmd BufWritePost .Xresources :!xrdb -merge .Xresources



"for running JAVA 
autocmd vimEnter *.java map <F8> :ALEToggle <bar> :w <CR>:execute ":!clear ; javac %; if [ -f %<.class ]; then time java %<; rm %<.class; fi"<bar> :ALEToggle<CR>

"" Fix backspace indent
set backspace=indent,eol,start
" for auto closing ending bracket
inoremap {<CR> {<CR>}<C-o>O

"Now let's do the hard part  -- 

let g:onedark_termcolors=256

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:airline_theme='atomic' " other similar themes (biogo, lucius)
" colorscheme onedark

noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>e :FZF -m<CR>
inoremap <C-H> <C-W>
