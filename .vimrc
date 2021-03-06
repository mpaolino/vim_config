set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Bundle 'wting/gitsessions.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

call vundle#end() " required
filetype plugin indent on " required
syntax on

set completeopt=menu
set showtabline=2

let mapleader = ","
let g:ycm_auto_trigger=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
""let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['go'] }
"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_fmt_command = "goimports"

:let g:session_autosave = 'yes'

let g:airline_powerline_fonts = 1

au BufRead,BufNewFile *.md set filetype=markdown

set number
set t_Co=256
set background=dark
set tabstop=4 
set shiftwidth=4
set virtualedit=all                       
set backspace=2
set nocompatible
set nowrap
set cursorline
set syntax=sh
set showmatch
set autoindent
"set expandtab
set history=150
set formatoptions=tcql
set nostartofline
set laststatus=2
set hlsearch
set foldmethod=syntax
set foldlevelstart=20

syntax on
colorscheme molokai
"hi CursorLine term=none cterm=none ctermbg=Black ctermfg=White
hi CursorLine term=none cterm=none ctermbg=Black
hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey
hi TabLine term=none cterm=none ctermfg=White ctermbg=DarkGrey
hi TabLineSel term=none cterm=none ctermfg=White ctermbg=Blue
"set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ [TYPE=%Y]\ \ \ \ \ \ \ \ [POS=%4l,%4v]\ \ \ \ \ \ [%p%%]\ [LEN=%L] 
"
"let NERDTreeQuitOnOpen = 1
set <F3>=OR
set <F4>=[[D
set <F5>=[[E
set <F6>=[17~
set <F7>=[18~
set <F8>=[19~
set <F9>=[20~
set <F10>=[21~
set <s-F2>=[24~
set <s-F4>=O1;2S
set <Del>=[3~
set <C-u>=
set <PageUp>=[5~
set <PageDown>=[6~
set <Home>=[1~
set <End>=[4~
set <Insert>=[2~

map  <C-n>       :NERDTreeToggle<CR>
map  <C-l>   <Esc>:tabn<CR>
map  <C-h>    <Esc>:tabp<CR>
map  <C-Down>    <Esc><C-w><Down>
map  <C-Up>      <Esc><C-w><Up>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

command JSONBeautyfier :%!python -m json.tool

