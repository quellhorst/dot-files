filetype plugin indent on

set number
set cursorline
set showmatch
syntax on
colorscheme blackboard

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set textwidth=0
set gfn=Inconsolata:h18

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader=","
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>n :NERDTreeToggle<CR>

" Emulate TextMate's shift left/right key commands
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
