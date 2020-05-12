" Plugins
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
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mileszs/ack.vim'
Plug 'osyo-manga/vim-over'
Plug 'posva/vim-vue'
Plug 'thinca/vim-qfreplace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" General config
syntax enable
command E Ex " Disambiguates E
filetype plugin on
set encoding=utf-8
set laststatus=2
set nowrap
set ignorecase smartcase
set t_Co=256
set number
set nobackup
set noswapfile
set noerrorbells
set spelllang=en_us
set hidden " Puts buffer in the background without writing
set lazyredraw " Don't update display during macros
set ttyfast " Send more characters at once
set history=999
set undolevels=999
set autoread
set title
set scrolloff=5
set sidescrolloff=7
set relativenumber
set wildmenu
set wildchar=<TAB>
set wildmode=full
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set diffopt=filler
set diffopt+=iwhite
set listchars=trail:·,nbsp:⚋
set fillchars=fold:-
set updatetime=100 " Keeps gitgutter speedy

" Tab setting
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent 
filetype plugin indent on

" Custom key commands
let mapleader=" "
inoremap jj <ESC>
inoremap jk <ESC>
vnoremap <C-c> "+y

" Buffer management
nnoremap <Leader>ff :CtrlP<CR> " Find a file in the current folder recursively
nnoremap <Leader>d :bd<CR> " Delete current buffer
nnoremap <Leader>D :bd!<CR> " Delete current buffer without saving
nnoremap <Leader>n :bn<CR> " Next buffer
nnoremap <Leader>N :bN<CR> " Previous buffer
nnoremap <Leader>t :enew<CR> " Make a new empty buffer
nnoremap <Tab> :b#<CR> " Tab between buffers

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Newline Generation
noremap <C-o> O<Esc>
noremap <CR> o<Esc>

" .vimrc editing
noremap <leader>vimrc :edit ~/.vimrc<CR>
autocmd! BufWritePost ~/.vimrc source $MYVIMRC | PlugStatus 

"Plugin Settings

" Colors
colorscheme solarized
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Ctrlp
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|tmp$\|dist$\|.git|.bak|.swp|.pyc|.class'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 10

" ALE
"let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '-'
highlight SignColumn term=bold cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight ALEErrorSign ctermfg=Red guifg=Red
highlight ALEWarningSign ctermfg=Red guifg=Red
let g:airline#extensions#ale#enabled = 1
autocmd BufWritePost *.js ALEFix

" Auto Pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" vim.ack
let g:ackprg = 'ag --nogroup --nocolor --column'

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
nnoremap <Leader>gs :Gstatus<CR> " Views status, use `-` and `p` to add/remove files
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gg :Gcommit -v -q %:p<CR> " Commits current file
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gm :Git merge<CR>

" Airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
