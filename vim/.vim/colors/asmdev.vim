" Vim color file
" Maintainer:   Hans Fugal <hans@fugal.net>
" Last Change:  $Date: 2003/05/06 16:37:49 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desert"

" color terminal definitions
hi SpecialKey	              ctermfg=darkgreen
hi NonText	     cterm=bold ctermfg=darkblue
hi Directory	              ctermfg=cyan
hi ErrorMsg	     cterm=bold ctermfg=white   ctermbg=darkred
hi IncSearch	   cterm=NONE ctermfg=yellow ctermbg=darkgreen
hi Search	       cterm=NONE ctermfg=yellow ctermbg=red
hi MoreMsg	                ctermfg=darkgreen
hi ModeMsg       cterm=NONE ctermfg=darkmagenta
hi LineNr	                  ctermfg=magenta
hi Question	                ctermfg=green
hi VertSplit	   cterm=reverse
hi Title	                  ctermfg=5
hi Visual	       cterm=bold
hi VisualNOS	   cterm=bold,underline
hi WarningMsg	              ctermfg=darkmagenta
hi WildMenu                 ctermfg=0        ctermbg=3
hi Folded	                  ctermfg=darkcyan ctermbg=black
hi FoldColumn	              ctermfg=darkgray ctermbg=darkgray
hi DiffAdd	                                 ctermbg=red
hi DiffChange	                               ctermbg=darkgray
hi DiffDelete	   cterm=bold ctermfg=4        ctermbg=cyan
hi DiffText	     cterm=bold                  ctermbg=black
hi Comment	                ctermfg=darkgreen
hi Constant	                ctermfg=brown
hi Special	                ctermfg=5
hi Identifier	              ctermfg=darkcyan
hi Statement	              ctermfg=darkcyan
hi PreProc	                ctermfg=5
hi Type		                  ctermfg=darkcyan
hi Underlined	 cterm=underline ctermfg=5
hi Ignore	     cterm=bold   ctermfg=7
hi Error	     cterm=bold   ctermfg=7 ctermbg=1

" color popup window
hi PmenuSel ctermfg=black ctermbg=darkred
hi Pmenu    ctermfg=white ctermbg=red

" color tabbar
hi TabLine    ctermfg=white ctermbg=black
hi TabLineSel ctermfg=white ctermbg=darkmagenta

" color status
hi StatusLine	 cterm=NONE ctermbg=darkmagenta ctermfg=white
hi StatusLineNC  cterm=reverse

hi phpComment        ctermfg=darkgreen    "comment
hi phpStringDouble   ctermfg=darkyellow   "string
hi phpStringSingle   ctermfg=yellow       "string
hi phpConditional    ctermfg=darkmagenta  "if
hi phpRepeat         ctermfg=darkmagenta  "foreach
hi phpKeyword        ctermfg=darkmagenta  "const
hi phpClasses        ctermfg=darkgray     "Exception
hi phpType           ctermfg=darkmagenta  "null
hi phpStructure      ctermfg=darkmagenta  "self class extends
hi phpStorageClass   ctermfg=darkmagenta  "class
hi phpIdentifier     ctermfg=darkcyan     "variable name
hi phpVarSelector    ctermfg=darkblue     "$
hi phpException      ctermfg=darkmagenta  "throw
hi phpFunction       ctermfg=darkred      "is_numeric
hi phpComparison     ctermfg=white        "== >= <=
hi phpBoolean        ctermfg=darkyellow   "true false
hi phpFunctions      ctermfg=darkgray     "is_numeric
hi phpOperator       ctermfg=darkgray     "! = :: isset
hi phpDefine         ctermfg=darkmagenta  "function
hi phpLabel          ctermfg=darkyellow   "case
hi phpMemberSelector ctermfg=darkgray
hi phpRelation       ctermfg=darkgray     "moge '=>' moge
hi phpStateMent      ctermfg=darkyellow   "break continue
"hi phpHereDoc        ctermfg=cyan

"hi phpBacktick      ctermfg=white
"hi phpFCKeyword     ctermfg=magenta
"hi phpSCKeyword     ctermfg=magenta

hi htmlTagName     ctermfg=darkgreen
hi htmlTag         ctermfg=darkgreen
hi htmlEndTag      ctermfg=darkgreen
hi htmlLink        cterm=none ctermfg=darkred 
hi htmlString      ctermfg=darkgray
hi htmlArg         ctermfg=white
hi htmlComment     ctermfg=cyan
hi htmlCommentPart ctermfg=cyan

hi javascriptOperator ctermfg=darkgray

hi QFError        cterm=bold ctermbg=lightgray ctermfg=black
"hi QFWarning
" hi QFInfo         xxx links to SpellRare
hi QuickFixLine   ctermbg=black
  
