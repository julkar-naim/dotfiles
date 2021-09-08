let g:polyglot_disabled = ['jsx']

call plug#begin('~/.vim/plugged')  " The plugins goes here
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'tibabit/vim-templates'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/spf13/vim-autoclose'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tomasr/molokai'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'romgrk/doom-one.vim'
call plug#end()


" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


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

command WQ wq
command Wq wq
command W w
command Q q

" ale
" let g:ale_linters = {}
" map <leader>at : ALEToggle<CR>

"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>


 " let loaded_matchparen = 1
 au InsertEnter * :NoMatchParen
 au InsertLeave * :DoMatchParen

 highlight NonText ctermfg=240
 highlight cComment ctermfg=240

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


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

" autocmd BufNewFile *.cpp 0r ~/template/temp.cpp
autocmd BufWinEnter *.cpp call cursor(13, 5)
" autocmd BufWinEnter *.cpp 
"

" One script for all language program runner

autocmd vimEnter * map <F8> :w <cr>:!~/.script/cpp_runner.sh % <cr>

autocmd BufWritePost .Xresources :!xrdb -merge .Xresources


"" Fix backspace indent
set backspace=indent,eol,start
" for auto closing ending bracket
inoremap {<CR> {<CR>}<C-o>O

" let g:airline_theme='atomic' " other similar themes (biogoo, lucius)
let g:airline_theme='lucius' 

set guifont=jetbrainsMono\ 10.5

noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>e :FZF -m<CR>
inoremap <C-H> <C-W>
set cmdheight=1

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>




"           ██████    ███████     ██████ 
"          ██░░░░██  ██░░░░░██   ██░░░░██
"         ██    ░░  ██     ░░██ ██    ░░ 
"        ░██       ░██      ░██░██       
"        ░██       ░██      ░██░██       
"        ░░██    ██░░██     ██ ░░██    ██
"         ░░██████  ░░███████   ░░██████ 
"          ░░░░░░    ░░░░░░░     ░░░░░░  




 highlight signcolumn ctermbg=NONE
 hi Pmenu ctermbg=black ctermfg=gray
 " hi PmenuSel ctermbg=244
 hi PmenuSbar ctermbg=black
 hi PmenuThumb ctermbg=black

 " Some servers have issues with backup files, see #649.
 " set nobackup
 " set nowritebackup

 " " Give more space for displaying messages.
 " set cmdheight=10

 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
 " delays and poor user experience.
 set updatetime=300

 " Don't pass messages to |ins-completion-menu|.
 set shortmess+=c

 " Always show the signcolumn, otherwise it would shift the text each time
 " diagnostics appear/become resolved.
 if has("patch-8.1.1564")
   " Recently vim can merge signcolumn and number column into one
   set signcolumn=number
 else
   set signcolumn=yes
 endif

 " Use tab for trigger completion with characters ahead and navigate.
 " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 " other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

 " Use <c-space> to trigger completion.
 if has('nvim')
   inoremap <silent><expr> <c-space> coc#refresh()
 else
   inoremap <silent><expr> <c-@> coc#refresh()
 endif

 " Make <CR> auto-select the first completion item and notify coc.nvim to
 " format on enter, <cr> could be remapped by other vim plugin
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 " Use `[g` and `]g` to navigate diagnostics
 " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
 nmap <silent> gp <Plug>(coc-diagnostic-prev)
 nmap <silent> gn <Plug>(coc-diagnostic-next)

 " GoTo code navigation.
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

 " Use K to show documentation in preview window.
 nnoremap <silent> K :call <SID>show_documentation()<CR>

 function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   elseif (coc#rpc#ready())
     call CocActionAsync('doHover')
   else
     execute '!' . &keywordprg . " " . expand('<cword>')
   endif
 endfunction

 " Highlight the symbol and its references when holding the cursor.
 autocmd CursorHold * silent call CocActionAsync('highlight')

 " Symbol renaming.
 nmap <leader>rn <Plug>(coc-rename)

 " Formatting selected code.
 xmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)

 augroup mygroup
   autocmd!
   " Setup formatexpr specified filetype(s).
   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   " Update signature help on jump placeholder.
   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
 augroup end

 " Applying codeAction to the selected region.
 " Example: `<leader>aap` for current paragraph
 xmap <leader>a  <Plug>(coc-codeaction-selected)
 nmap <leader>a  <Plug>(coc-codeaction-selected)

 " Remap keys for applying codeAction to the current buffer.
 nmap <leader>ac  <Plug>(coc-codeaction)
 " Apply AutoFix to problem on the current line.
 nmap <leader>qf  <Plug>(coc-fix-current)

 " Map function and class text objects
 " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
 xmap if <Plug>(coc-funcobj-i)
 omap if <Plug>(coc-funcobj-i)
 xmap af <Plug>(coc-funcobj-a)
 omap af <Plug>(coc-funcobj-a)
 xmap ic <Plug>(coc-classobj-i)
 omap ic <Plug>(coc-classobj-i)
 xmap ac <Plug>(coc-classobj-a)
 omap ac <Plug>(coc-classobj-a)

 " Remap <C-f> and <C-b> for scroll float windows/popups.
 if has('nvim-0.4.0') || has('patch-8.2.0750')
   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 endif

 " Use CTRL-S for selections ranges.
 " Requires 'textDocument/selectionRange' support of language server.
 nmap <silent> <C-s> <Plug>(coc-range-select)
 xmap <silent> <C-s> <Plug>(coc-range-select)

 " Add `:Format` command to format current buffer.
 command! -nargs=0 Format :call CocAction('format')

 " Add `:Fold` command to fold current buffer.
 command! -nargs=? Fold :call     CocAction('fold', <f-args>)

 " Add `:OR` command for organize imports of the current buffer.
 command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

 " Add (Neo)Vim's native statusline support.
 " NOTE: Please see `:h coc-status` for integrations with external plugins that
 " provide custom statusline: lightline.vim, vim-airline.
 set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

 " Mappings for CoCList
 " Show all diagnostics.
 nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
 " Manage extensions.
 nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
 " Show commands.
 nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
 " Find symbol of current document.
 nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
 " Search workspace symbols.
 nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
 " Do default action for next item.
 nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
 " Do default action for previous item.
 nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
 " Resume latest coc list.
 nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" let g:user_emmet_install_global = 0
" autocmd FileType html,css,js EmmetInstall
imap <C-BS> <C-W>
set backspace=indent,eol,start
highlight LineNr ctermfg=grey
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:js_file_import_use_fzf = 1
let g:js_file_import_package_first = 0
colorscheme onedark
