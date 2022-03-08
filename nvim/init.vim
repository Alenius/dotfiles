let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/.vim/plugged")
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'BurntSushi/ripgrep'
Plug 'TheAtlasEngine/PastelColors'
Plug 'gruvbox-community/gruvbox'
Plug 'cormacrelf/vim-colors-github'
Plug 'fcpg/vim-fahrenheit'
Plug 'tpope/vim-commentary'
Plug 'ggreer/the_silver_searcher'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'szw/vim-maximizer'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jparise/vim-graphql'
Plug 'preservim/nerdtree'
call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors='16'
colorscheme github

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
set signcolumn=yes
set termguicolors
set scrolloff=8
set list
set listchars=tab:>-  
set splitright
set ignorecase
set smartcase

let mapleader = ' '
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>faf :Files<CR>
nnoremap <leader>af :CocCommand eslint.executeAutofix<CR>
nnoremap <leader>dd :Buffers<CR>
nnoremap <leader>rr :Rg 
nnoremap <leader>p <C-^>
nnoremap <leader>p <C-^>
nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>gi :vertical Git<cr>

let g:NERDCreateDefaultMappings = 1
let g:NERDTreeWinPos = "right"

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
nmap <silent> gsd :vs<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>cff :GFiles <C-r>=expand("%:h")<CR>/<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfunction

" keep split when closing buffer
" command Bd bp\|bd \#
command Bd bp | sp | bn | bd

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <silent> + <C-W>>
nmap <silent> - <C-W><
