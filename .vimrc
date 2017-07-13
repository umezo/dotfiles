" ---------------------------------------
"  dein
" ---------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.dein

call dein#begin('~/.dein')

call dein#add('Shougo/dein.vim')
call dein#add('mattn/emmet-vim.git'           )
call dein#add('Shougo/unite.vim.git'          )
call dein#add('thinca/vim-ft-svn_diff.git'    )
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('scrooloose/syntastic.git'      )
call dein#add('hrsh7th/vim-versions.git'      )
call dein#add('leafgarland/typescript-vim.git')
call dein#add('kchmck/vim-coffee-script')
call dein#add('lambdalisue/unite-grep-vcs')
call dein#add('slim-template/vim-slim')
call dein#add('mxw/vim-jsx')
call dein#add('pangloss/vim-javascript')
call dein#add('flowtype/vim-flow')

call dein#end()

filetype plugin indent on
" ---------------------------------------

let g:syntastic_ignore_files=['.html$','.tpl$']
let g:syntastic_coffee_coffeelint_args = '-f ~/.coffeelintrc'
let g:syntastic_scss_scss_lint_args = '-c ~/.scss-lint.yml'
let g:syntastic_javascript_checkers=['eslint']
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1

filetype on
filetype plugin on                                            " enable filetype plugin
syntax on                                                     " enable syntax hilighting
set t_Co=256

let g:user_emmet_leader_key = '<C-F>'                       " set TAB key to trigger for zen coding

set hlsearch                                                  " hilight words in search
set incsearch                                                 " use incremental search
set ruler                                                     " show ruler
set showmatch                                                 " hilight bracket when a bracket is inserted
set showmode                                                  " shoe current editor mode in status line

set encoding=utf-8                                            " set encoding 
set termencoding=utf-8                                        " set terminal encoding
set fileencoding=utf-8                                        " set file encoding
set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs2le,ucs-2       " set priority to detect file encoding 
set fileformat=unix                                           " set line break charactor

let g:use_xhtml = 1
let g:html_use_css = 1
let g:html_no_pre = 1

set nocompatible                                              " disable vi compatibility
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
nnoremap <leader><c-f><c-f> :call system("eslint --fix " . expand("%"))<CR>:e!<CR>:w<CR>
nnoremap <silent> <C-c><C-d> :cd %:h<CR>

nnoremap <silent> <F10> :tabedit ~/.vimrc<CR>
nnoremap <F11> :source ~/.vimrc<CR>:echo "updated"<CR>

inoremap <C-o> <ESC>o
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

nnoremap <leader><c-u><c-f> :Unite file_rec/async:
nnoremap <leader><c-u><c-g> :Unite grep/git:.<CR><c-r><c-w>
nnoremap <leader><c-u><c-v> :UniteVersions
nnoremap <leader><c-u><c-l> :Unite line
nnoremap <leader><c-u><c-r> :UniteResume<CR>

"vmap <silent> <C-a>= :Alignta =<CR>

colorscheme asmdev                                            " color setting

call unite#custom#default_action('file', 'tabopen')
call unite#custom#default_action('jump_list', 'tabopen')
call unite#custom_max_candidates('file_rec,file_rec/async', 0)

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
set listchars=tab:\|\ ,trail:^

au BufNewFile,BufRead *.json.jbuilder set ft=ruby

command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
