" =============================================================================
" Lottie Vim Colorscheme
" =============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 03 September, 2024
" Last updated on: 23 April, 2026
"
" This file contains colorscheme inspired by `Unokai`, which is similarly
" inspired by `Monokai` theme.

" -----------------------------------------------------------------------------
" Color hex & description
" -----------------------------------------------------------------------------
" #111111     Background/Statusline foreground (A)
" #c61e5c     Red/Magenta
" #81af24     Green
" #fd971f     Orange (A)
" #51aebe     Pale Cyan
" #ae81ff     Purple (A)
" #80beb5     Pale Green
" #272727     Statusline/On selection background (A)
" #3c3c3c     Comment/Tab-bar background (A)
" #cc4f51     Red/Magenta Bright (A)
" #3db16e     Green/Lime (A)
" #fbeb7e     Yellow (A)
" #53a5b5     Blue/Cyan (A)
" #fd5ff0     Pink
" #f8f8f2     Off/White (A)
" #8a8a8a     Line number
" #e5ab3f     End of file (~)

set background=dark

hi clear
let g:colors_name = 'lottie'
let s:t_Co = has('gui_running') ? 16777216 : str2nr(&t_Co)
let s:tgc = has('termguicolors') && &termguicolors

let g:terminal_ansi_colors = [
   \ '#111111',
   \ '#c61e5c',
   \ '#81af24',
   \ '#fd971f',
   \ '#51aebe',
   \ '#ae81ff',
   \ '#80beb5',
   \ '#272727',
   \ '#3c3c3c',
   \ '#cc4f51',
   \ '#3db16e',
   \ '#fbeb7e',
   \ '#53a5b5',
   \ '#fd5ff0',
   \ '#272727',
   \ '#f8f8f2',
   \ ]

hi!  link  CursorLineFold         FoldColumn
hi!  link  CursorLineSign         SignColumn
hi!  link  Define                 Identifier
hi!  link  Delimiter              PreProc
hi!  link  Float                  Number
hi!  link  Label                  String
hi!  link  MessageWindow          Pmenu
hi!  link  Number                 Constant
hi!  link  Operator               PreProc
hi!  link  PopupNotification      Todo
hi!  link  StatusLineTerm         StatusLine
hi!  link  StatusLineTermNC       StatusLineNC
hi!  link  StorageClass           PreProc
hi!  link  Structure              PreProc
hi!  link  TabPanel               Normal
hi!  link  TabPanelFill           Normal
hi!  link  Terminal               Normal
hi!  link  markdownCode           Comment
hi!  link  markdownCodeBlock      markdownCode
hi!  link  markdownCodeDelimiter  markdownCode

hi  Normal                    guifg=#f8f8f2  guibg=#111111  guisp=NONE     gui=NONE          ctermfg=255   ctermbg=235   cterm=NONE          term=NONE
hi  Added                     guifg=#5fd75f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=77    ctermbg=NONE  cterm=NONE          term=NONE
hi  Changed                   guifg=#cc4f51  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=215   ctermbg=NONE  cterm=NONE          term=NONE
hi  Character                 guifg=#3db16e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=112   ctermbg=NONE  cterm=NONE          term=NONE
hi  ColorColumn               guifg=NONE     guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=240   cterm=NONE          term=reverse
hi  Comment                   guifg=#3c3c3c  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=244   ctermbg=NONE  cterm=NONE          term=NONE
hi  Conceal                   guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  Constant                  guifg=#ae81ff  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=141   ctermbg=NONE  cterm=NONE          term=NONE
hi  CurSearch                 guifg=#cc4f51  guibg=#111111  guisp=NONE     gui=reverse       ctermfg=215   ctermbg=235   cterm=reverse       term=reverse
hi  CursorColumn              guifg=NONE     guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=237   cterm=NONE          term=NONE
hi  CursorLine                guifg=NONE     guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=237   cterm=NONE          term=underline
hi  CursorLineNr              guifg=#dadada  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=253   ctermbg=NONE  cterm=NONE          term=NONE
hi  Debug                     guifg=#80beb5  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=73    ctermbg=NONE  cterm=NONE          term=NONE
hi  DiffAdd                   guifg=#5faf5f  guibg=NONE     guisp=NONE     gui=reverse       ctermfg=71    ctermbg=NONE  cterm=reverse       term=reverse
hi  DiffChange                guifg=#5f87af  guibg=NONE     guisp=NONE     gui=reverse       ctermfg=67    ctermbg=NONE  cterm=reverse       term=NONE
hi  DiffDelete                guifg=#af5f5f  guibg=NONE     guisp=NONE     gui=reverse       ctermfg=131   ctermbg=NONE  cterm=reverse       term=reverse
hi  DiffText                  guifg=#af87af  guibg=NONE     guisp=NONE     gui=reverse       ctermfg=139   ctermbg=NONE  cterm=reverse       term=reverse
hi  Directory                 guifg=#272727  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=116   ctermbg=NONE  cterm=NONE          term=NONE
hi  EndOfBuffer               guifg=#e5ab3f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  Error                     guifg=#cc4f51  guibg=#000000  guisp=NONE     gui=reverse       ctermfg=197   ctermbg=16    cterm=reverse       term=NONE,reverse
hi  ErrorMsg                  guifg=#cc4f51  guibg=#000000  guisp=NONE     gui=reverse       ctermfg=197   ctermbg=16    cterm=reverse       term=NONE,reverse
hi  FoldColumn                guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  Folded                    guifg=#272727  guibg=#414141  guisp=NONE     gui=NONE          ctermfg=250   ctermbg=238   cterm=NONE          term=NONE
hi  Function                  guifg=#3db16e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=112   ctermbg=NONE  cterm=NONE          term=NONE
hi  Identifier                guifg=#53a5b5  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=81    ctermbg=NONE  cterm=NONE          term=NONE
hi  Ignore                    guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=NONE
hi  IncSearch                 guifg=#cc4f51  guibg=#111111  guisp=NONE     gui=reverse       ctermfg=215   ctermbg=235   cterm=reverse       term=NONE,reverse,underline
hi  LineNr                    guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  LineNrAbove               guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  LineNrBelow               guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  MatchParen                guifg=#fd971f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=208   ctermbg=NONE  cterm=NONE          term=NONE,underline
hi  ModeMsg                   guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=NONE
hi  MoreMsg                   guifg=#81af24  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=106   ctermbg=NONE  cterm=NONE          term=NONE
hi  NonText                   guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  Pmenu                     guifg=NONE     guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=240   cterm=NONE          term=reverse
hi  PmenuExtra                guifg=#272727  guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=250   ctermbg=240   cterm=NONE          term=NONE
hi  PmenuExtraSel             guifg=#272727  guibg=#8a8a8a  guisp=NONE     gui=NONE          ctermfg=250   ctermbg=245   cterm=NONE          term=NONE
hi  PmenuKind                 guifg=#80beb5  guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=73    ctermbg=240   cterm=NONE          term=NONE
hi  PmenuKindSel              guifg=#80beb5  guibg=#8a8a8a  guisp=NONE     gui=NONE          ctermfg=73    ctermbg=245   cterm=NONE          term=NONE
hi  PmenuMatch                guifg=#cc4f51  guibg=#3a392f  guisp=NONE     gui=NONE          ctermfg=215   ctermbg=240   cterm=NONE          term=NONE
hi  PmenuMatchSel             guifg=#cc4f51  guibg=#8a8a8a  guisp=NONE     gui=NONE          ctermfg=215   ctermbg=245   cterm=NONE          term=NONE
hi  PmenuSbar                 guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=reverse
hi  PmenuSel                  guifg=NONE     guibg=#8a8a8a  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=245   cterm=NONE          term=NONE
hi  PmenuThumb                guifg=NONE     guibg=#3c3c3c  guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=244   cterm=NONE          term=NONE
hi  PreProc                   guifg=#cc4f51  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=197   ctermbg=NONE  cterm=NONE          term=NONE
hi  Question                  guifg=#fbeb7e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=185   ctermbg=NONE  cterm=NONE          term=standout
hi  QuickFixLine              guifg=#111111  guibg=#51aebe  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=141   cterm=NONE          term=NONE
hi  Removed                   guifg=#d75f5f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=167   ctermbg=NONE  cterm=NONE          term=NONE
hi  Search                    guifg=#53a5b5  guibg=#111111  guisp=NONE     gui=reverse       ctermfg=81    ctermbg=235   cterm=reverse       term=reverse
hi  SignColumn                guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=reverse
hi  Special                   guifg=#80beb5  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=73    ctermbg=NONE  cterm=NONE          term=NONE
hi  SpecialKey                guifg=#8a8a8a  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=245   ctermbg=NONE  cterm=NONE          term=NONE
hi  SpellBad                  guifg=NONE     guibg=NONE     guisp=#d75f5f  gui=undercurl     ctermfg=167   ctermbg=NONE  cterm=underline     term=underline
hi  SpellCap                  guifg=NONE     guibg=NONE     guisp=#cc4f51  gui=undercurl     ctermfg=215   ctermbg=NONE  cterm=underline     term=underline
hi  SpellLocal                guifg=NONE     guibg=NONE     guisp=#5fd75f  gui=undercurl     ctermfg=77    ctermbg=NONE  cterm=underline     term=underline
hi  SpellRare                 guifg=NONE     guibg=NONE     guisp=#fd5ff0  gui=undercurl     ctermfg=207   ctermbg=NONE  cterm=underline     term=underline
hi  Statement                 guifg=#cc4f51  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=197   ctermbg=NONE  cterm=NONE          term=NONE
hi  StatusLine                guifg=#f8f8f2  guibg=#272727  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=250   cterm=NONE          term=NONE,reverse
hi  StatusLineNC              guifg=#f8f8f2  guibg=#3c3c3c  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=244   cterm=NONE          term=NONE,underline
hi  String                    guifg=#fbeb7e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=185   ctermbg=NONE  cterm=NONE          term=NONE
hi  TabLine                   guifg=#f8f8f2  guibg=#3c3c3c  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=244   cterm=NONE          term=NONE,underline
hi  TabLineFill               guifg=#f8f8f2  guibg=#3c3c3c  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=244   cterm=NONE          term=NONE
hi  TabLineSel                guifg=#f8f8f2  guibg=#272727  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=250   cterm=NONE          term=NONE,reverse
hi  Title                     guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=NONE
hi  TitleBar                  guifg=#dadada  guibg=#484943  guisp=NONE     gui=NONE          ctermfg=253   ctermbg=237   cterm=NONE          term=NONE
hi  TitleBarNC                guifg=#272727  guibg=#383933  guisp=NONE     gui=NONE          ctermfg=250   ctermbg=236   cterm=NONE          term=NONE
hi  Todo                      guifg=#dadada  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=253   ctermbg=NONE  cterm=NONE          term=NONE,reverse
hi  ToolbarButton             guifg=#3c3c3c  guibg=#f8f8f2  guisp=NONE     gui=NONE,reverse  ctermfg=244   ctermbg=255   cterm=NONE,reverse  term=NONE,reverse
hi  ToolbarLine               guifg=NONE     guibg=NONE     guisp=NONE     gui=NONE          ctermfg=NONE  ctermbg=NONE  cterm=NONE          term=reverse
hi  Type                      guifg=#fd971f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=208   ctermbg=NONE  cterm=NONE          term=NONE
hi  Underlined                guifg=#53a5b5  guibg=NONE     guisp=NONE     gui=underline     ctermfg=81    ctermbg=NONE  cterm=underline     term=underline
hi  VertSplit                 guifg=#3c3c3c  guibg=#3c3c3c  guisp=NONE     gui=NONE          ctermfg=244   ctermbg=244   cterm=NONE          term=NONE
hi  Visual                    guifg=#f8f8f2  guibg=#272727  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=250   cterm=NONE          term=NONE,reverse
hi  VisualNOS                 guifg=#f8f8f2  guibg=#80beb5  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=73    cterm=NONE          term=NONE
hi  WarningMsg                guifg=#cc4f51  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=197   ctermbg=NONE  cterm=NONE          term=standout
hi  WildMenu                  guifg=#111111  guibg=#fbeb7e  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=185   cterm=NONE          term=NONE
hi  debugBreakpoint           guifg=#111111  guibg=#cc4f51  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=197   cterm=NONE          term=NONE
hi  debugPC                   guifg=#111111  guibg=#51aebe  guisp=NONE     gui=NONE          ctermfg=235   ctermbg=73    cterm=NONE          term=NONE
hi  htmlBold                  guifg=#f8f8f2  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=255   ctermbg=NONE  cterm=NONE          term=NONE
hi  htmlItalic                guifg=#f8f8f2  guibg=NONE     guisp=NONE     gui=italic        ctermfg=255   ctermbg=NONE  cterm=underline     term=underline
hi  markdownH1Delimiter       guifg=#cc4f51  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=197   ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownH2Delimiter       guifg=#fbeb7e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=185   ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownH3Delimiter       guifg=#fd971f  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=208   ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownH4Delimiter       guifg=#53a5b5  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=81    ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownH5Delimiter       guifg=#51aebe  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=73    ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownH6Delimiter       guifg=#3db16e  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=112   ctermbg=NONE  cterm=NONE          term=NONE
hi  markdownHeadingDelimiter  guifg=#f8f8f2  guibg=NONE     guisp=NONE     gui=NONE          ctermfg=255   ctermbg=NONE  cterm=NONE          term=NONE

if has('gui_running') || s:tgc
  hi  Cursor   guifg=#000000  guibg=#dadada  guisp=NONE  gui=NONE  cterm=NONE
  hi  lCursor  guifg=#111111  guibg=#5fff00  guisp=NONE  gui=NONE  cterm=NONE
endif

if s:tgc || s:t_Co >= 256
  finish
endif

if s:t_Co >= 16
  hi  Normal                    ctermfg=white        ctermbg=black        cterm=NONE
  hi  Added                     ctermfg=darkgreen    ctermbg=NONE         cterm=NONE
  hi  Changed                   ctermfg=darkyellow   ctermbg=NONE         cterm=NONE
  hi  Character                 ctermfg=green        ctermbg=NONE         cterm=NONE
  hi  ColorColumn               ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  Comment                   ctermfg=darkgray     ctermbg=NONE         cterm=NONE
  hi  Conceal                   ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  Constant                  ctermfg=darkmagenta  ctermbg=NONE         cterm=NONE
  hi  CurSearch                 ctermfg=red          ctermbg=black        cterm=reverse
  hi  CursorColumn              ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  CursorLine                ctermfg=NONE         ctermbg=NONE         cterm=underline
  hi  CursorLineNr              ctermfg=white        ctermbg=NONE         cterm=NONE
  hi  Debug                     ctermfg=darkcyan     ctermbg=NONE         cterm=NONE
  hi  DiffAdd                   ctermfg=darkgreen    ctermbg=NONE         cterm=reverse
  hi  DiffChange                ctermfg=darkblue     ctermbg=NONE         cterm=reverse
  hi  DiffDelete                ctermfg=darkred      ctermbg=NONE         cterm=reverse
  hi  DiffText                  ctermfg=darkmagenta  ctermbg=NONE         cterm=reverse
  hi  Directory                 ctermfg=cyan         ctermbg=NONE         cterm=NONE
  hi  EndOfBuffer               ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  Error                     ctermfg=red          ctermbg=black        cterm=reverse
  hi  ErrorMsg                  ctermfg=red          ctermbg=black        cterm=reverse
  hi  FoldColumn                ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  Folded                    ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  Function                  ctermfg=green        ctermbg=NONE         cterm=NONE
  hi  Identifier                ctermfg=blue         ctermbg=NONE         cterm=NONE
  hi  Ignore                    ctermfg=NONE         ctermbg=NONE         cterm=NONE
  hi  IncSearch                 ctermfg=red          ctermbg=black        cterm=reverse
  hi  LineNr                    ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  LineNrAbove               ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  LineNrBelow               ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  MatchParen                ctermfg=darkyellow   ctermbg=NONE         cterm=NONE
  hi  ModeMsg                   ctermfg=NONE         ctermbg=NONE         cterm=NONE
  hi  MoreMsg                   ctermfg=darkgreen    ctermbg=NONE         cterm=NONE
  hi  NonText                   ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  Pmenu                     ctermfg=black        ctermbg=gray         cterm=NONE
  hi  PmenuExtra                ctermfg=darkgray     ctermbg=gray         cterm=NONE
  hi  PmenuExtraSel             ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  PmenuKind                 ctermfg=darkred      ctermbg=gray         cterm=NONE
  hi  PmenuKindSel              ctermfg=darkred      ctermbg=darkyellow   cterm=NONE
  hi  PmenuMatch                ctermfg=black        ctermbg=gray         cterm=NONE
  hi  PmenuMatchSel             ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  PmenuSbar                 ctermfg=NONE         ctermbg=gray         cterm=NONE
  hi  PmenuSel                  ctermfg=black        ctermbg=darkyellow   cterm=NONE
  hi  PmenuThumb                ctermfg=gray         ctermbg=black        cterm=NONE
  hi  PreProc                   ctermfg=red          ctermbg=NONE         cterm=NONE
  hi  Question                  ctermfg=yellow       ctermbg=NONE         cterm=NONE
  hi  QuickFixLine              ctermfg=black        ctermbg=darkmagenta  cterm=NONE
  hi  Removed                   ctermfg=darkred      ctermbg=NONE         cterm=NONE
  hi  Search                    ctermfg=blue         ctermbg=black        cterm=reverse
  hi  SignColumn                ctermfg=NONE         ctermbg=NONE         cterm=NONE
  hi  Special                   ctermfg=darkcyan     ctermbg=NONE         cterm=NONE
  hi  SpecialKey                ctermfg=darkgrey     ctermbg=NONE         cterm=NONE
  hi  SpellBad                  ctermfg=darkred      ctermbg=NONE         cterm=underline
  hi  SpellCap                  ctermfg=darkyellow   ctermbg=NONE         cterm=underline
  hi  SpellLocal                ctermfg=darkgreen    ctermbg=NONE         cterm=underline
  hi  SpellRare                 ctermfg=magenta      ctermbg=NONE         cterm=underline
  hi  Statement                 ctermfg=red          ctermbg=NONE         cterm=NONE
  hi  StatusLine                ctermfg=black        ctermbg=gray         cterm=NONE
  hi  StatusLineNC              ctermfg=black        ctermbg=darkgray     cterm=NONE
  hi  String                    ctermfg=yellow       ctermbg=NONE         cterm=NONE
  hi  TabLine                   ctermfg=black        ctermbg=darkgray     cterm=NONE
  hi  TabLineFill               ctermfg=black        ctermbg=darkgray     cterm=NONE
  hi  TabLineSel                ctermfg=black        ctermbg=gray         cterm=NONE
  hi  Title                     ctermfg=NONE         ctermbg=NONE         cterm=NONE
  hi  TitleBar                  ctermfg=white        ctermbg=black        cterm=NONE
  hi  TitleBarNC                ctermfg=gray         ctermbg=black        cterm=NONE
  hi  Todo                      ctermfg=white        ctermbg=NONE         cterm=NONE
  hi  ToolbarButton             ctermfg=darkgray     ctermbg=white        cterm=NONE,reverse
  hi  ToolbarLine               ctermfg=NONE         ctermbg=NONE         cterm=NONE
  hi  Type                      ctermfg=darkyellow   ctermbg=NONE         cterm=NONE
  hi  Underlined                ctermfg=blue         ctermbg=NONE         cterm=underline
  hi  VertSplit                 ctermfg=darkgray     ctermbg=darkgray     cterm=NONE
  hi  Visual                    ctermfg=cyan         ctermbg=black        cterm=reverse
  hi  VisualNOS                 ctermfg=black        ctermbg=darkcyan     cterm=NONE
  hi  WarningMsg                ctermfg=red          ctermbg=NONE         cterm=NONE
  hi  WildMenu                  ctermfg=black        ctermbg=yellow       cterm=NONE
  hi  debugBreakpoint           ctermfg=black        ctermbg=red          cterm=NONE
  hi  debugPC                   ctermfg=black        ctermbg=darkblue     cterm=NONE
  hi  htmlBold                  ctermfg=white        ctermbg=NONE         cterm=NONE
  hi  htmlItalic                ctermfg=white        ctermbg=NONE         cterm=underline
  hi  markdownH1Delimiter       ctermfg=red          ctermbg=NONE         cterm=NONE
  hi  markdownH2Delimiter       ctermfg=yellow       ctermbg=NONE         cterm=NONE
  hi  markdownH3Delimiter       ctermfg=darkyellow   ctermbg=NONE         cterm=NONE
  hi  markdownH4Delimiter       ctermfg=blue         ctermbg=NONE         cterm=NONE
  hi  markdownH5Delimiter       ctermfg=darkblue     ctermbg=NONE         cterm=NONE
  hi  markdownH6Delimiter       ctermfg=green        ctermbg=NONE         cterm=NONE
  hi  markdownHeadingDelimiter  ctermfg=white        ctermbg=NONE         cterm=NONE
  finish
endif

if s:t_Co >= 8
  hi  Normal                    ctermfg=gray         ctermbg=black       cterm=NONE
  hi  Added                     ctermfg=darkgreen    ctermbg=NONE        cterm=NONE
  hi  Changed                   ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  Character                 ctermfg=darkgreen    ctermbg=NONE        cterm=NONE
  hi  ColorColumn               ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  Comment                   ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  Conceal                   ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  Constant                  ctermfg=darkmagenta  ctermbg=NONE        cterm=NONE
  hi  CurSearch                 ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  CursorColumn              ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  CursorLine                ctermfg=NONE         ctermbg=NONE        cterm=underline
  hi  CursorLineNr              ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  Debug                     ctermfg=darkcyan     ctermbg=NONE        cterm=NONE
  hi  DiffAdd                   ctermfg=darkgreen    ctermbg=NONE        cterm=reverse
  hi  DiffChange                ctermfg=darkblue     ctermbg=NONE        cterm=reverse
  hi  DiffDelete                ctermfg=darkred      ctermbg=NONE        cterm=reverse
  hi  DiffText                  ctermfg=darkmagenta  ctermbg=NONE        cterm=reverse
  hi  Directory                 ctermfg=darkcyan     ctermbg=NONE        cterm=NONE
  hi  EndOfBuffer               ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  Error                     ctermfg=darkred      ctermbg=gray        cterm=NONE,reverse
  hi  ErrorMsg                  ctermfg=darkred      ctermbg=gray        cterm=NONE,reverse
  hi  FoldColumn                ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  Folded                    ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  Function                  ctermfg=darkgreen    ctermbg=NONE        cterm=NONE
  hi  Identifier                ctermfg=darkblue     ctermbg=NONE        cterm=NONE
  hi  Ignore                    ctermfg=NONE         ctermbg=NONE        cterm=NONE
  hi  IncSearch                 ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  LineNr                    ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  LineNrAbove               ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  LineNrBelow               ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  MatchParen                ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  ModeMsg                   ctermfg=NONE         ctermbg=NONE        cterm=NONE
  hi  MoreMsg                   ctermfg=darkgreen    ctermbg=NONE        cterm=NONE
  hi  NonText                   ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  Pmenu                     ctermfg=black        ctermbg=gray        cterm=NONE
  hi  PmenuExtra                ctermfg=black        ctermbg=gray        cterm=NONE
  hi  PmenuExtraSel             ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  PmenuKind                 ctermfg=darkred      ctermbg=gray        cterm=NONE
  hi  PmenuKindSel              ctermfg=darkred      ctermbg=darkyellow  cterm=NONE
  hi  PmenuMatch                ctermfg=black        ctermbg=gray        cterm=NONE
  hi  PmenuMatchSel             ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  PmenuSbar                 ctermfg=NONE         ctermbg=gray        cterm=NONE
  hi  PmenuSel                  ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  PmenuThumb                ctermfg=gray         ctermbg=black       cterm=NONE
  hi  PreProc                   ctermfg=darkred      ctermbg=NONE        cterm=NONE
  hi  Question                  ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  QuickFixLine              ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  Removed                   ctermfg=darkred      ctermbg=NONE        cterm=NONE
  hi  Search                    ctermfg=black        ctermbg=darkblue    cterm=NONE
  hi  SignColumn                ctermfg=NONE         ctermbg=NONE        cterm=NONE
  hi  Special                   ctermfg=darkcyan     ctermbg=NONE        cterm=NONE
  hi  SpecialKey                ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  SpellBad                  ctermfg=darkred      ctermbg=gray        cterm=reverse
  hi  SpellCap                  ctermfg=darkblue     ctermbg=gray        cterm=reverse
  hi  SpellLocal                ctermfg=darkgreen    ctermbg=black       cterm=reverse
  hi  SpellRare                 ctermfg=darkmagenta  ctermbg=gray        cterm=reverse
  hi  Statement                 ctermfg=darkred      ctermbg=NONE        cterm=NONE
  hi  StatusLine                ctermfg=gray         ctermbg=black       cterm=NONE,reverse
  hi  StatusLineNC              ctermfg=gray         ctermbg=black       cterm=reverse
  hi  String                    ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  TabLine                   ctermfg=black        ctermbg=gray        cterm=NONE
  hi  TabLineFill               ctermfg=gray         ctermbg=gray        cterm=NONE
  hi  TabLineSel                ctermfg=black        ctermbg=gray        cterm=NONE
  hi  Title                     ctermfg=NONE         ctermbg=NONE        cterm=NONE
  hi  TitleBar                  ctermfg=white        ctermbg=black       cterm=NONE
  hi  TitleBarNC                ctermfg=gray         ctermbg=black       cterm=NONE
  hi  Todo                      ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  ToolbarButton             ctermfg=gray         ctermbg=black       cterm=reverse
  hi  ToolbarLine               ctermfg=NONE         ctermbg=NONE        cterm=NONE
  hi  Type                      ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  Underlined                ctermfg=darkblue     ctermbg=NONE        cterm=underline
  hi  VertSplit                 ctermfg=gray         ctermbg=gray        cterm=NONE
  hi  Visual                    ctermfg=black        ctermbg=darkcyan    cterm=NONE
  hi  VisualNOS                 ctermfg=black        ctermbg=darkcyan    cterm=NONE
  hi  WarningMsg                ctermfg=darkred      ctermbg=NONE        cterm=NONE
  hi  WildMenu                  ctermfg=black        ctermbg=darkyellow  cterm=NONE
  hi  debugBreakpoint           ctermfg=black        ctermbg=darkcyan    cterm=NONE
  hi  debugPC                   ctermfg=black        ctermbg=darkblue    cterm=NONE
  hi  htmlBold                  ctermfg=gray         ctermbg=NONE        cterm=NONE
  hi  htmlItalic                ctermfg=gray         ctermbg=NONE        cterm=underline
  hi  markdownH1Delimiter       ctermfg=darkred      ctermbg=NONE        cterm=NONE
  hi  markdownH2Delimiter       ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  markdownH3Delimiter       ctermfg=darkyellow   ctermbg=NONE        cterm=NONE
  hi  markdownH4Delimiter       ctermfg=darkblue     ctermbg=NONE        cterm=NONE
  hi  markdownH5Delimiter       ctermfg=darkblue     ctermbg=NONE        cterm=NONE
  hi  markdownH6Delimiter       ctermfg=darkgreen    ctermbg=NONE        cterm=NONE
  hi  markdownHeadingDelimiter  ctermfg=gray         ctermbg=NONE        cterm=NONE
  finish
endif

if s:t_Co >= 0
  hi  Cursor            term=reverse
  hi  CursorIM          term=NONE
  hi  CursorLineFold    term=underline
  hi  CursorLineSign    term=underline
  hi  Float             term=NONE
  hi  Number            term=NONE
  hi  StatusLineTerm    term=NONE,reverse
  hi  StatusLineTermNC  term=NONE,underline
  hi  Terminal          term=NONE
  finish
endif
