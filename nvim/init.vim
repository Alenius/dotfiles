call plug#begin("~/.config/nvim/.vim/plugged")
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'BurntSushi/ripgrep'
Plug 'TheAtlasEngine/PastelColors'
Plug 'gruvbox-community/gruvbox'
Plug 'fcpg/vim-fahrenheit'
Plug 'tpope/vim-commentary'
Plug 'ggreer/the_silver_searcher'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors='16'
colorscheme gruvbox

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set relativenumber
set scrolloff=8
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set colorcolumn=100
set signcolumn=yes
set termguicolors
set scrolloff=8

let mapleader = ' '
nnoremap <leader>ff :Files<CR>
nnoremap <leader>af :CocCommand eslint.executeAutofix<CR>
nnoremap <leader>dd :Buffers<CR>
nnoremap <leader>rr :Rg 
nnoremap <leader>p <C-^>

let g:NERDCreateDefaultMappings = 1

" for CoC
" Use K to show documentation in preview window
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>cff :Files <C-r>=expand("%:h")<CR>/<CR>

