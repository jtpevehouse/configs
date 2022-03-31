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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""""
"   COLOR SCHEME   "
""""""""""""""""""""
set termguicolors
set background=dark
colorscheme nord

""""""""""""""""""""
"    TREE SITTER   "
""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "css",
    "go",
    "java",
    "javascript",
    "python",
    "typescript"
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

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
" MARKDOWN PREVIEW "
""""""""""""""""""""
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '${name}'
let g:mkdp_filetypes = ['markdown']


""""""""""""""""""""
"      REMAPS      "
""""""""""""""""""""
command! Difft  NERDTreeClose | windo diffthis
command! Diffts diffoff! | NERDTree
nnoremap <F1>   :noh<CR>
nnoremap <F2>   :MarkdownPreview<CR>
nnoremap <F3>   :MarkdownPreviewStop<CR>
nnoremap <F5>   :NERDTreeToggle<CR>
nnoremap <F9>   :Difft<CR>
nnoremap <F10>  :Diffts<CR>
nnoremap <F11>  :vertical resize -5<CR>
nnoremap <F12>  :vertical resize +5<CR>
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
