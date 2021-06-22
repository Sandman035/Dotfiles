""""""""""""""""""""""""""""
"                          "
"       Nvim Settings      "
"                          "
""""""""""""""""""""""""""""

runtime! archlinux.vim

set nowrap

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

set t_ZH=^[[3m
set t_ZR=^[[23m

set updatetime=300

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

nnoremap <F5> :!make <enter>

""""""""""""""""""""""""""""
"                          "
"       Plugin list        "
"                          "
""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'ntk148v/vim-horizon'
Plug 'octol/vim-cpp-enhanced-highlight'
"'Plug 'bfrg/vim-cpp-modern'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'cormacrelf/vim-colors-github'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/lilydjwg/colorizer'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tikhomirov/vim-glsl'

call plug#end()

""""""""""""""""""""""""""""
"                          "
"      Plugin Settings     "
"                          "
""""""""""""""""""""""""""""

let g:fzf_layout = { 'down': '40%' }

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }


nnoremap <silent> <C-f> :Files<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""
"                          "
"     Syntax Settings      "
"                          "
""""""""""""""""""""""""""""

set termguicolors

colorscheme onedark
let g:onedark_terminal_italics = 1

let g:lightline = {'colorscheme' : 'one'}
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
set number

highlight Comment gui=italic
highlight Function gui=italic

