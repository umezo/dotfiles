set nocompatible
set runtimepath+=~/.config/nvimplugin/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvimplugin' )
  call dein#begin('~/.config/nvimplugin')

  call dein#add('~/.config/nvimplugin/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim.git')
  call dein#add('scrooloose/syntastic.git')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('slim-template/vim-slim')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('flowtype/vim-flow')

  call dein#end()
  call dein#save_state()
endif


filetype on
filetype plugin on                                            " enable filetype plugin
syntax on                                                     " enable syntax hilighting
set t_Co=256

set hlsearch                                                  " hilight words in search
"set incsearch                                                 " use incremental search
set ruler                                                     " show ruler
set showmatch                                                 " hilight bracket when a bracket is inserted
set showmode                                                  " shoe current editor mode in status line

set encoding=utf-8                                            " set encoding
set termencoding=utf-8                                        " set terminal encoding
set fileencoding=utf-8                                        " set file encoding
set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs2le,ucs-2       " set priority to detect file encoding
set fileformat=unix                                           " set line break charactor

set number                                                    " show line number on left side
set noswapfile                                                " disable swap file
set nobackup                                                  " disable backup
set ignorecase                                                " ignore case in search
set smartindent                                               " enable smart indent
set autoindent                                                " enable auto indent
set tabstop=2                                                 " set tab stop to 2
set sts=2                                                     " soft tab stop
set sw=2                                                      " shift width
set splitright                                                " split window to right   (:sp
set splitbelow                                                " split window to bellow  (:vs
set backspace=2                                               " delete indent , eol and start by Back space
set expandtab                                                 " use space instead of tab
set nowrap                                                    " disable line wrapping

set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2                                              " always show status line

set diffopt=iwhite,filler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP
"________________________________________________________________________________
let mapleader = "\<TAB>" "means <c-i>
nnoremap <Space> /
nnoremap t :tabedit +tabmove .
nnoremap e :e .
nnoremap <silent> <C-p> :tabnext<CR>
nnoremap <silent> <C-n> :tabprevious<CR>
nnoremap <silent> <C-h> :nohl<CR>
nnoremap > <C-w>>
nnoremap < <C-w><
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

inoremap <C-o> <ESC>o
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" Unite
nnoremap <leader><c-u><c-f> :Denite file_rec:
nnoremap <leader><c-u><c-g> :Denite grep/git:.<CR><c-r><c-w>
nnoremap <leader><c-u><c-v> :DeniteVersions
nnoremap <leader><c-u><c-l> :Denite line
nnoremap <leader><c-u><c-r> :DeniteResume<CR>

" eslint
nnoremap <leader><c-f><c-f> :call system("eslint --fix " . expand("%"))<CR>:e!<CR>:w<CR>

colorscheme asmdev " color setting

let g:my_coding_style = {}
let g:my_coding_style['s']  = 'setlocal expandtab'
let g:my_coding_style['t']  = 'setlocal noexpandtab'
let g:my_coding_style['s2'] = 'setlocal expandtab   tabstop=2 shiftwidth=2 softtabstop=2'
let g:my_coding_style['t2'] = 'setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2'
let g:my_coding_style['s4'] = 'setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4'
let g:my_coding_style['t4'] = 'setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4'
command! -bar -nargs=1 CodingStyle execute get(g:my_coding_style, <f-args>, '')

autocmd! BufNewFile,BufRead *.ejs setlocal filetype=html
autocmd! Filetype ejs setlocal filetype=html
autocmd! BufNewFile,BufRead *.as setlocal filetype=actionscript
autocmd! Filetype as setlocal filetype=actionscript
autocmd! BufNewFile,BufRead *.js setlocal filetype=javascript
autocmd! Filetype js setlocal filetype=javascript
autocmd! Filetype smarty setlocal filetype=html
autocmd! Filetype javascript execute get(g:my_coding_style, 's2', '')
autocmd! Filetype actionscript execute get(g:my_coding_style, 's4', '')
autocmd! Filetype coffee execute get(g:my_coding_style, 's2', '')
autocmd! Filetype vim execute get(g:my_coding_style, 's2', '')
autocmd! Filetype php execute get(g:my_coding_style, 's4', '')
autocmd! Filetype html execute get(g:my_coding_style, 's2', '')
autocmd! Filetype xhtml execute get(g:my_coding_style, 's2', '')
autocmd! Filetype css execute get(g:my_coding_style, 's2', '')
autocmd! Filetype scss execute get(g:my_coding_style, 's2', '')


