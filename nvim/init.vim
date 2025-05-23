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
Plug 'tpope/vim-rhubarb'
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
Plug 'jparise/vim-graphql'
Plug 'preservim/nerdtree'
Plug 'yssl/QFEnter'
Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
Plug 'f-person/auto-dark-mode.nvim'
call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_termcolors='16'
set bg=dark
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
set signcolumn=yes
set termguicolors
set scrolloff=8
set list
set listchars=tab:>-  
set lcs+=space:· " show spaces as dots
set splitright
set ignorecase
set smartcase
" title name in terminal tab
set title
set titlestring=%f
set cursorline
set foldmethod=syntax
set foldopen+=jump

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
" previous git revisions
nnoremap <leader>gp :0GlLog<cr>

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
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(0) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(0) : "\<S-TAB>"
" Use enter to choose completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

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

nmap <silent> gd <Plug>(coc-definition) 
nmap <silent> gsd :vs<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <leader>cff :GFiles <C-r>=expand("%:h")<CR>/<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfunction

" keep split when closing buffer
command! Bd bp | sp | bn | bd

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <silent> + <C-W>>
nmap <silent> - <C-W><

let g:airline#extensions#projectdir#enabled = 1

" make it easier to open buffers from quickfix window
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

autocmd BufEnter *.graphql :setlocal tabstop=3 shiftwidth=3 expandtab!

" colors for definition pop out window highlighting
hi CocMenuSel guifg=#e4e4e4 guibg=#000000
hi CocSearch guifg=#0087ff

lua require("scripts")
lua require('auto-dark-mode').setup()


let g:copilot_filetypes = {
\ 'xml': v:false,
\ }

let g:go_gopls_settings = {
\ 'ui.diagnostic.staticcheck': v:true, 
\}

set foldopen-=block

lua << EOF
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
EOF

try
    nmap <silent> [c :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry
