" =============================================================================
" General Vim options
" =============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 13 December, 2017
" Last updated on: 29 March, 2026
"
" This file contains options/configurations for modifying the general
" behaviour of my (overall) Vim text editor.

" -----------------------------------------------------------------------------
" Set configurations
" -----------------------------------------------------------------------------
set autoindent                          " Enables basic auto-indentation
set autoread                            " Auto reload the file if changed
set backspace=indent,eol,start          " Enables backspacing over everything
set encoding=utf-8                      " Set UTF-8 encoding, by default
set expandtab                           " Use spaces instead of tabs
set hlsearch                            " Highlight search results
set ignorecase                          " Ignore case when searching
set incsearch                           " Highlight search results as you type
set list                                " Enable list mode
set listchars=trail:$,tab:██            " Show trailing and tab characters
set mouse=n                             " Allows dragging with mouse
set nobackup                            " Disable creationg of persistent backups
set nocompatible                        " Disable vim compatiblity
set noswapfile                          " Disable creation of `.swp` files
set nowrap                              " Disable line wrapping
set nowritebackup                       " Disable temporary backups
set number                              " Enables line numbering
set path+=**                            " Search down into subfolders
set relativenumber                      " Show relative line number
set shiftwidth=4                        " Shift (in/dedent) by X spaces
set showmatch                           " Show matching (), [], or {}
set smartcase                           " Override ignorecase if search has caps
set smartindent                         " Enables basic auto-indentation
set softtabstop=4                       " Shift (in/dedent) by X spaces
set spelllang=en_gb                     " Set British English as language
set splitbelow                          " Open horizontal splits below
set splitright                          " Open vertical splits to the right
set tabstop=4                           " Shift (in/dedent) by X spaces
set termguicolors                       " Allows usage of GUI values
set textwidth=80                        " Automatically wrap lines
set wildmenu                            " Display all matching files

" -----------------------------------------------------------------------------
" NetRW configurations
" -----------------------------------------------------------------------------
let g:netrw_liststyle=3                 " Show tree view (in netrw mode)
let g:netrw_bufsettings= 'noma'         " Non-modifiable
let g:netrw_bufsettings+='nomod'        " Non-modified
let g:netrw_bufsettings+='nu'           " Show number lines (in netrw mode)
let g:netrw_bufsettings+='nobl'         " No buffer listed
let g:netrw_bufsettings+='nowrap'       " Don't wrap the words
let g:netrw_bufsettings+='ro'           " Read only mode

" -----------------------------------------------------------------------------
" Statusline configurations
" -----------------------------------------------------------------------------
set laststatus=2                        " Show status line always
set statusline=                         " Show an empty statusline
set statusline +=%F                     " Show complete filename
set statusline +=\ %m%r                 " Show modified/readonly flag(s)
set statusline +=\ %=                   " Align everything to right
set statusline +=\ Line:\ %l/%L         " Show line X of Y
set statusline +=\ Col:\ %c             " Show current column

" -----------------------------------------------------------------------------
" Syntax, theme, and colour configurations
" -----------------------------------------------------------------------------
syntax on                               " Enable syntax highlighting
let g:indentLine_char = '┊'             " Indentation character
let g:indentLine_leadingSpaceChar = '.' " Character used in indentations
let g:indentLine_leadingSpaceEnabled = 1" Show characters in indentations
let &t_SI = "\e[1 q"                    " Blink in Insert mode
let &t_EI = "\e[1 q"                    " Blink in Normal mode
colorscheme lottie                      " Colour theme + syntax highlighting

" -----------------------------------------------------------------------------
" Functions to add (some) functionality
" -----------------------------------------------------------------------------
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
    if !&modified
        return
    endif
    if expand('%:t') ==# 'options.vim'
        return
    endif
    let l:view = winsaveview()
    let l:date = strftime('%d %B, %Y')
    silent! keepjumps keeppatterns
        \ 1,30s/\v^(\s*[^A-Za-z0-9]*\s*)Last updated on:.*$/\=submatch(1).'Last updated on: '.l:date/e
    call winrestview(l:view)
endfunction

" Remove git commit message template line
function! s:RemoveTemplateLine() abort
    if line('$') >=14
        call setline(14, '')
    else
        call append(line('$'), repeat([''], 14 - line('$')))
    endif
    call cursor(14, 1)
    startinsert
endfunction

" -----------------------------------------------------------------------------
" Filetype-specific configurations and Autocmds
" -----------------------------------------------------------------------------
filetype plugin indent on

" Filetype specific configurations
augroup FileTypeSpecificConfigurations
    autocmd!
    autocmd FileType netrw      setlocal bufhidden=delete
    autocmd FileType python     setlocal colorcolumn=72,80
    autocmd FileType rst        setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 spell colorcolumn=80
    autocmd FileType vim        setlocal textwidth=0
augroup END

" Auto-update `Last updated on` date on save
augroup UpdateLastModified
    autocmd!
    autocmd BufWritePre * call s:UpdateLastUpdated()
augroup END

" Auto-delete all trailing whitespace(s) on save
augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * if search('\s\+$', 'nw') | %s/\s\+$//e | endif
augroup END

" Automatically `cd` into the directory that the current file is in
augroup AutoChdir
    autocmd!
    autocmd BufEnter * if &buftype == '' | execute "chdir " . escape(expand("%:p:h"), ' ') | endif
augroup END

" Automatically remove git commit template line
augroup CommitMsgCleanup
    autocmd!
    autocmd FileType gitcommit autocmd BufWinEnter <buffer> call s:RemoveTemplateLine()
augroup END

" -----------------------------------------------------------------------------
" Installed plugin(s) and theme(s)
" -----------------------------------------------------------------------------
call s:install('dense-analysis/ale', { 'type': 'start' })
call s:install('junegunn/fzf', { 'type': 'start' })
call s:install('junegunn/fzf.vim', { 'type': 'start' })
call s:install('Yggdroot/indentLine', { 'group': 'vendor', 'type': 'start' })
call s:install('rust-lang/rust.vim', { 'type': 'start' })

" -----------------------------------------------------------------------------
" Abbreviations
" -----------------------------------------------------------------------------
iab <expr> filemeta strftime(
\ "Author: Akshay Mestry <xa@mes3.dev>\n"
\ . "Created on: %d %B, %Y\n"
\ . "Last updated on: %d %B, %Y"
\ )
