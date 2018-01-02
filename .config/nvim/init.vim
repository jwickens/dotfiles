" make sure path to python is found
let g:python3_host_prog = '/Users/jonathanwickens/bin/miniconda3/bin/python'
set shell=zsh
set hidden " allow hidden buffers - this is necessary for 'tabs'

" line numbers
set number
set relativenumber

" vim status verbosity
set noshowmode
set laststatus=2

" assume git for anything important - so no need to use swap files
set autowrite
set history=50
set noswapfile
set nobackup
set nowritebackup

" indentation settings
set expandtab
set tabstop=2
set shiftwidth=2
set list listchars=tab:»·,trail:· " show trailing and tab chars
set backspace=2

" Highlight search matches
set hlsearch

call plug#begin('~/.local/share/nvim/plugged')

" General look and feel
Plug 'trevordmiller/nova-vim' " color theme
Plug 'vim-airline/vim-airline' " bottom status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' " git status of files in nerd tree

" syntax plugins
Plug 'pangloss/vim-javascript' 
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'

" auto complete and advaned features
Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-apple-darwin'}
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'


call plug#end()

colorscheme nova

" Move splits by using ctrl + regular movment commands (tnoremap for terminal mode)
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
noremap <c-h> <c-w><c-h>
tnoremap <c-j> <c-\><c-n><c-w><c-j>
tnoremap <c-k> <c-\><c-n><c-w><c-k>
tnoremap <c-l> <c-\><c-n><c-w><c-l>
tnoremap <c-h> <c-\><c-n><c-w><c-h>

" move buffers by using ctrl + n or p
let g:airline#extensions#tabline#enabled = 1
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprev<cr>

" further patches for the way neovims terminal works.
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert
au BufWinEnter,WinEnter term://* startinsert
au BufLeave * stopinsert

" language client settings
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio'],
\ }

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

