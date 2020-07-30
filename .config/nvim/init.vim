language en_US

call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sgur/vim-editorconfig'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash.install.sh'
  \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" behavior
set clipboard+=unnamedplus

" look and feel
set cmdheight=2
set t_Co=256
syntax on
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="mirage"
colorscheme ayu
let g:airline_theme="ayu_mirage"

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype indent off

" line numbers
set number
set relativenumber

" show title
set title

nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> Z :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> S :call LanguageClient#textDocument_documentSymbol()<CR>
" }}}
