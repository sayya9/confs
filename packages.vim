" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" General enhancements
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Custom textobjects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Initialize plugin system
call plug#end()
