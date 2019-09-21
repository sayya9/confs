source ~/dotfiles/packages.vim

set nocompatible
set hidden
set history=5000
set pastetoggle=<f5>
set incsearch
set mouse=a
set splitright
set splitbelow

" Customize the way that Vim handles tab-completion at the command prompt
set wildmenu
set wildmode=full

" Make backspace work like most other programs: set backspace=indent,eol,start
set backspace=2

" Show whitespace and tab
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Highlight all matches
set hlsearch

" Change filetype
autocmd Filetype yaml set filetype=ansible expandtab
autocmd BufRead,BufNewFile,BufEnter *.yaml.j2 set filetype=ansible expandtab
autocmd BufNewFile,BufRead Dockerfile* setf dockerfile

" For lightline.vim
set laststatus=2

" Ignore East Asian characters
set spelllang=en,cjk

" Highlight the currnet line and column
" See: https://medium.com/usevim/highlight-the-current-line-b6ff8af798c7
hi cursorline cterm=none term=none
set cursorline
highlight CursorLine guibg=#303000 ctermbg=235
highlight CursorColumn guibg=#303000 ctermbg=237

" Highlight the SpellBad
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

" For NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" For groovy
autocmd BufNewFile,BufRead Jenkinsfile* setf groovy
autocmd FileType groovy setlocal ts=4 sts=4 sw=4 expandtab autoindent

" Mappings
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
noremap <F3> :set cursorcolumn!<CR>
inoremap <F3> <C-o>:set cursorcolumn!<CR>
cnoremap <F3> <C-c>:set cursorcolumn!<CR>
noremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>
cnoremap <F4> <C-c>:set list!<CR>
noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
noremap <Leader>n nzz
noremap <Leader>N Nzz
map <C-n> :NERDTreeToggle<CR>

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
