set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'wting/rust.vim'
Bundle 'scrooloose/syntastic'
Bundle 'wting/gitsessions.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

:let g:gitgutter_realtime = 0
:let mapleader = ","
"" YouCompleteMe options
""will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
""highlighting
let g:ycm_auto_trigger=0
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 0 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
:se completeopt=menu
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['go'] }

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

let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_fmt_command = "goimports"

:let g:session_autosave = 'yes'

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
set expandtab
set history=150
set formatoptions=tcql
set nostartofline
set laststatus=2
set hlsearch
set foldmethod=syntax
set foldlevelstart=20

syntax on
colorscheme hybrid
"hi CursorLine term=none cterm=none ctermbg=Black ctermfg=White
hi CursorLine term=none cterm=none ctermbg=Black
hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey
hi TabLine term=none cterm=none ctermfg=White ctermbg=DarkGrey
hi TabLineSel term=none cterm=none ctermfg=White ctermbg=Blue
set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ [TYPE=%Y]\ \ \ [%{fugitive#statusline()}]\ \ \ \ \ [POS=%4l,%4v]\ \ \ \ \ \ [%p%%]\ [LEN=%L] 

let NERDTreeQuitOnOpen = 1
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

" :nmap - Display normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps

map  <C-n>       :NERDTreeToggle<CR>
map  <C-Right>   <Esc>:tabn<CR>
map  <C-Left>    <Esc>:tabp<CR>
map  <C-Down>    <Esc><C-w><Down>
map  <C-Up>      <Esc><C-w><Up>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set tabline=%!MyTabLine()  " custom tab pages line
"----------------------------------------------------------------------------------------------
function Comenta()
  let nombre = expand('%')
  let largo  = len(nombre) - 4
  let extension = strpart(nombre, largo, 4)

  if extension == ".cbl"
      let columna  = 7
      let caracter = "*"
  else
      let columna  = 1
      let caracter = "#"
  endif

  let posicion_original=getpos(".")
      let linea = getline(".")
      if len(linea) < columna
          let linea = linea."        "
      endif
      let linea=strpart(linea, 0, columna - 1). caracter .strpart(linea, columna - 1,1000)
      call setline(".", linea)
endfunction

"----------------------------------------------------------------------------------------------
function DesComenta()
  let nombre    = expand('%')
  let extension = expand("%:e")
  let linea     = getline(".")
  let columna   = 1
  let caracter  = ""
  let comment_char = ""

  if extension == "cbl"
      let columna  = 7
      let caracter = ""
      if strpart(linea, 7,1) != " "
          let caracter = ""
      endif
  endif
        
  let posicion_original=getpos(".")
  if len(linea) < columna
      let linea = linea."        "
  endif
  let linea=strpart(linea, 0, columna - len(caracter)). caracter .strpart(linea, columna,1000)
  call setline(".", linea)
endfunction

"----------------------------------------------------------------------------------------------
function Compila()
    let nombre    = expand('%')
    let extension = expand("%:e")
    if extension == '.cbl'
        silent execute ':wa!'
        execute ':on'
        let cbl = expand('%')
        let lst = substitute(cbl, '.cbl', '.lst', 'g')
        :silent execute(':! qcomp '.cbl)
        :mode 
        :silent execute(':! grep "Errors: 0, Warnings: 0" '.lst)
        if v:shell_error
            execute ':sp '.lst
        else
            echo 'Empate'
        endif
    endif
    if extension == "go"
        silent execute ":wa!"
        execute ':GoBuild'
    endif
endfunction

function Compila2()
    let nombre    = expand('%')
    let largo     = len(nombre) - 4
    let extension = strpart(nombre, largo, 4)
    if extension == '.cbl'
        silent execute ':wa!'
        execute ':on'
        let cbl = expand('%')
        let lst = substitute(cbl, '.cbl', '.lst', 'g')
        :silent execute(':! qcompilo '.cbl)
        :mode 
        execute ':sp '.lst
    endif
endfunction

function Error()
  let linea     = getline(".")
  let linea_err = strpart(linea, 19, 6)
  if linea_err > 0
      execute ':wincmd w'
      execute ':'.linea_err
  endif
endfunction

function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction
