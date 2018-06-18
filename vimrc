source ~/dotfiles/packages.vim

set nocompatible
set hidden
set history=5000
set pastetoggle=<f5>

" Customize the way that Vim handles tab-completion at the command prompt
set wildmenu
set wildmode=full

" Make backspace work like most other programs: set backspace=indent,eol,start
set backspace=2

" Replace yaml to ansible filetype
autocmd Filetype yaml set filetype=ansible

" Mappings
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
