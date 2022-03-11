:set number
:set shiftwidth     =4
:set softtabstop    =4
:set shiftwidth     =4
:set expandtab


""""""""""""""""""""
"     PLUGINS      "
""""""""""""""""""""
call plug#begin()

" Plug 'ellisonleao/gruvbox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""""
"   COLOR SCHEME   "
""""""""""""""""""""
set termguicolors
set background=dark
colorscheme nord

""""""""""""""""""""
"   TREE STATUS    "
""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

""""""""""""""""""""
"     LIGHTLINE    "
""""""""""""""""""""
let g:lightline = { 'colorscheme': 'nord'}

""""""""""""""""""""
"    PRETTIER      "
""""""""""""""""""""
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

""""""""""""""""""""
"      REMAPS      "
""""""""""""""""""""
nnoremap <F5> :NERDTreeToggle<CR>
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
