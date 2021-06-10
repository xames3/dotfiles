" ============================================================================
" General Vim options
" ============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 13 December, 2020
" Last updated on: 09 January, 2026
"
" This file contains options/configurations for modifying the general
" behaviour of my (overall) Vim text editor.

" ----------------------------------------------------------------------------
" Set configurations
" ----------------------------------------------------------------------------
set autoindent                          " Enables basic auto-indentation
set backspace=indent,eol,start          " Enables backspacing over everything
set colorcolumn=79                      " Show column (bar) at X characters
set expandtab                           " Use spaces instead of tabs
set hlsearch                            " Highlight search results
set list                                " Enable list mode
set listchars=trail:$,tab:██            " Show trailing and tab characters
set mouse=n                             " Allows dragging with mouse
set nocompatible                        " Disable vim compatiblity
set nospell                             " Turn off spell checking
set number                              " Enables line numbering
set relativenumber                      " Show relative line number
set shiftwidth=4                        " Shift (in/dedent) by X spaces
set showmatch                           " Show matching (), [], or {}
set smartindent                         " Enables basic auto-indentation
set softtabstop=4                       " Shift (in/dedent) by X spaces
set spelllang=en_gb                     " Set British English as language
set tabstop=4                           " Shift (in/dedent) by X spaces
set termguicolors                       " Allows usage of GUI values
set textwidth=79                        " Automatically wrap lines

" ----------------------------------------------------------------------------
" NetRW configurations
" ----------------------------------------------------------------------------
let g:netrw_liststyle=3                 " Show tree view (in netrw mode)
let g:netrw_bufsettings= 'noma'         " Non-modifiable
let g:netrw_bufsettings+='nomod'        " Non-modified
let g:netrw_bufsettings+='nu'           " Show number lines (in netrw mode)
let g:netrw_bufsettings+='nobl'         " No buffer listed
let g:netrw_bufsettings+='nowrap'       " Don't wrap the words
let g:netrw_bufsettings+='ro'           " Read only mode

" ----------------------------------------------------------------------------
" Statusline configurations
" ----------------------------------------------------------------------------
set laststatus=2                        " Show status line always
set statusline=                         " Show an empty statusline
set statusline +=%F                     " Show complete filename
set statusline +=\ %m%r                 " Show modified/readonly flag(s)
set statusline +=\ %=                   " Align everything to right
set statusline +=\ %{GitHead()}         " Show git branch
set statusline +=\ Line:\ %l/%L         " Show line X of Y
set statusline +=\ Col:\ %c             " Show current column

" ----------------------------------------------------------------------------
" Syntax, theme, and colour configurations
" ----------------------------------------------------------------------------
syntax on                               " Enables syntax highlighting
let g:indentLine_char = '┊'             " Indentation character
colorscheme srcery                      " Colour theme + syntax highlighting

" ----------------------------------------------------------------------------
" Functions to add (some) functionality
" ----------------------------------------------------------------------------
" Show current git branch (HEAD)
function! GitHead()
    let l:branchname = system(
        \ "git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
        \ )
  return strlen(l:branchname) > 0?' HEAD: '.l:branchname.' ':''
endfunction

" Ensure a GitHub plugin/theme is installed and loaded correctly
function! s:install(repo, ...) abort
    let args = {
        \ 'group': 'plugins',
        \ 'type': 'opt',
        \ 'load': 1,
        \ }

    if a:0 > 0 && type(a:1) == v:t_dict
        call extend(args, a:1)
    endif

    let name = fnamemodify(a:repo, ':t')
    let base = expand('~/.vim/pack/' . args.group . '/' . args.type)
    let path = base . '/' . name

    if !isdirectory(path)
        call mkdir(base, 'p')
        execute '!git clone --depth=1 https://github.com/' .
            \ a:repo . ' ' . shellescape(path)
    endif

    if args.type ==# 'opt' && args.load
        execute 'packadd! ' . name
    endif
endfunction

" Auto-update `Last updated on` date on save
function! s:UpdateLastUpdated() abort
    let l:date = strftime('%d %B, %Y')

    if expand('%:t') ==# 'options.vim'
        return
    endif

    silent! keepjumps keeppatterns
        \ %s/\v^(\s*[^A-Za-z0-9]*\s*)Last updated on:.*$/\=submatch(1).'Last updated on: '.l:date/e
endfunction

" ----------------------------------------------------------------------------
" Filetype-specific configurations and Autocmds
" ----------------------------------------------------------------------------
filetype plugin indent on

" Filetype specific configurations
augroup FileTypeSpecificConfigurations
    autocmd!
    autocmd FileType netrw      setlocal bufhidden=delete
    autocmd FileType python     setlocal colorcolumn=72,79
    autocmd FileType rst        setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
    autocmd FileType vim        setlocal textwidth=0
augroup END

" Auto-update `Last updated on` date on save
augroup UpdateLastModified
    autocmd!
    autocmd BufWritePre * call s:UpdateLastUpdated()
augroup END

" ----------------------------------------------------------------------------
" Installed plugin(s) and theme(s)
" ----------------------------------------------------------------------------
call s:install('srcery-colors/srcery-vim', { 'group': 'themes' })
call s:install('dense-analysis/ale', { 'type': 'start' })
call s:install('junegunn/fzf', { 'type': 'start' })
call s:install('junegunn/fzf.vim', { 'type': 'start' })
call s:install('Yggdroot/indentLine', { 'group': 'vendor', 'type': 'start' })

" ----------------------------------------------------------------------------
" Abbreviations
" ----------------------------------------------------------------------------
iab <expr> filemeta strftime(
\ "Author: Akshay Mestry <xa@mes3.dev>\n"
\ . "Created on: %d %B, %Y\n"
\ . "Last updated on: %d %B, %Y"
\ )
