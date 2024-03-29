set nocompatible

" General config
set encoding=utf-8
set laststatus=2
set nowrap
set ignorecase smartcase
set number
set hidden " Puts buffer in the background without writing
set nobackup
set noswapfile
set noerrorbells
set spelllang=en_us
set lazyredraw " Don't update display during macros
set ttyfast " Send more characters at once
set history=999
set undolevels=999
set autoread
set title
set scrolloff=5
set sidescrolloff=7
set relativenumber

"Auto complete command
set wildmenu
set wildchar=<TAB>
set wildmode=full
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set diffopt=filler
set diffopt+=iwhite
set listchars=trail:·,nbsp:⚋
set fillchars=fold:-
set updatetime=100 " Keeps gitgutter speedy
set mouse=a

" Syntax
syntax enable
filetype plugin on
set redrawtime=10000

" Tab setting
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
filetype indent on

" Search Highlighting
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Custom key commands
let mapleader=" "
inoremap jj <ESC>
vnoremap <C-c> "+y
nnoremap <Leader>pv :Ex<Cr>

" Buffer management
nnoremap <Leader>d :bdelete<CR> " Delete current buffer
nnoremap <Leader>D :bw!<CR> " Wipe current buffer without saving
nnoremap <Leader>n :bnext<CR> " Next buffer
nnoremap <Leader>N :bNext<CR> " Previous buffer
nnoremap <Leader>t :enew<CR> " Make a new empty buffer
nnoremap <Leader><Tab> :b#<CR> " Tab between buffers

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Newline Generation
noremap <CR> o<Esc>

" .vimrc editing and sourcing
noremap <leader>vimrc :edit ~/.vimrc<CR>
noremap <Leader>vs :source $MYVIMRC<CR>

"Plugin Settings
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
    call plug#begin(stdpath('config') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Style
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ludovicchabant/vim-gutentags'
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/vim-peekaboo'
Plug 'thinca/vim-qfreplace'

" General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'

call plug#end()

" Coc
let g:coc_global_extensions = [
            \'coc-html',
            \'coc-eslint',
            \'coc-vetur',
            \'coc-tsserver',
            \'coc-json', 
            \'coc-css', 
            \'coc-go',
            \'coc-pyright',
            \'coc-git',
            \'coc-explorer',
            \'coc-tabnine',
            \]

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


" Vim Test
let test#strategy = 'vimux'
let g:test#echo_command = 0
nnoremap <silent> <leader>tc :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
nnoremap <silent> <leader>tcw :TestNearest --watch<CR>
nnoremap <silent> <leader>tfw :TestFile --watch<CR>
nnoremap <silent> <leader>taw :TestSuite --watch<CR>
nnoremap <silent> <leader>tlw :TestLast --watch<CR>
nnoremap <silent> <leader>tgw :TestVisit --watch<CR>

" Colors
" colorscheme solarized
" set background=dark
" let g:solarized_termcolors = &t_Co
" let g:solarized_termtrans = 1
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" highlight SignColumn term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Ctrlp
nnoremap <Leader>pp :CtrlP<CR> " Find a file in the current folder recursively
let g:ctrlp_use_caching=1
let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|tmp$\|dist$\|.git|.bak|.swp|.pyc|.class'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_height=10 

" Auto Pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" vim.ack
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>pg :Ack 

" Find and replace
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" Fugitive
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gc :Git commit -v -q<CR>
nnoremap <Leader>gp :!git push -u origin HEAD<CR>
nnoremap <Leader>gm :Git merge<CR>

" Airline
let g:airline_theme='tokyonight'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Peekaboo
let g:peekaboo_compact = 1
