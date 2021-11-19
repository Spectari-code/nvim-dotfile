:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard+=unnamedplus
"syntax on

:call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify' " Start screen for vim

Plug 'sheerun/vim-polyglot' " Language pack

Plug 'sbdchd/neoformat' " Format code

Plug 'https://github.com/Raimondi/delimitMate'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Vim Go

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'             " Status bar themes

Plug 'https://github.com/preservim/nerdtree'      " NerdTree

Plug 'https://github.com/tree-sitter/tree-sitter-go'   " Treesitter for Go
Plug 'https://github.com/tree-sitter/tree-sitter-html' " ^ Html
Plug 'https://github.com/tree-sitter/tree-sitter-css'  " ^ Css
Plug 'https://github.com/tree-sitter/tree-sitter-javascript' " ^ Js
Plug 'https://github.com/tree-sitter/tree-sitter-python' " ^ Python

Plug 'nvim-lua/plenary.nvim'          " Telescope dependancy
Plug 'nvim-telescope/telescope.nvim'  " Telescope

Plug 'https://github.com/ryanoasis/vim-devicons'		" Icons
Plug 'https://github.com/kyazdani42/nvim-web-devicons'	" Icons

Plug 'Mofiqul/dracula.nvim' " Dracula theme

call plug#end()

"""" Theme Setting """"

"let g:termguicolors = true
"let g:dracula_show_end_of_buffer = false  " default false, Turn on or off EndOfBuffer symbol
"let g:dracula_transparent_bg = flase " default false, enables transparent background
colorscheme dracula

" Airline theme
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1


" Transparent background
highlight Normal guibg=none
highlight NonText guibg=none


""" End Theme Setting """"



"""" NerdTree Settings """"

" Keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"""" End NerdTree Settings """"


"""" Telescope Settings """"

" Keybindings
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""" End Telesope Settings """"


"""" CoC Settings """"

" Keybindings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

"""" End CoC Setting """"



"""" Airline Setting """"

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

"""" End Airline Setting """"

""" Buffer """"
" Move between buffers
nnoremap <silent> <c-n> :bnext<CR>
nnoremap <silent> <c-p> :bprev<CR>

"""" Buffer """"


""" Navigate Windows """"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Navigate Windows """"


"""" Vim-Go """"

"let g:go_highlight_types = 0


""""
