language en_US
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'reasonml-editor/vim-reason'
Plug 'chriskempson/base16-vim'
call plug#end()

let g:ycm_semantic_triggers = {
  \ 'reason': ['.']
  \ }

set t_Co=256
colorscheme base16-default-dark
highlight Normal ctermbg=0 guibg=0
set background=dark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
