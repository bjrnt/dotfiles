call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'sgur/vim-editorconfig'
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash.install.sh'
  \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

if executable('rustc')
	Plug 'rust-lang/rust.vim', { 'for': 'rust' }
	Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif

call plug#end()

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

" Racer
set hidden
let g:racer_cmd = "/home/ubuntu/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:autofmt_autosave = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)

" Rust
" << LSP >> {{{
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
  \ }

nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> Z :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> S :call LanguageClient#textDocument_documentSymbol()<CR>
" }}}
