" =============================================================================
" Custom key-bindings/remappings
" =============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 13 December, 2020
" Last updated on: 24 January, 2026
"
" This file contains my custom key-bindings/remappings that I use for my code
" development.
"
" -----------------------------------------------------------------------------
" Space (bar) as the leader key
" -----------------------------------------------------------------------------
let mapleader = " "

" -----------------------------------------------------------------------------
" General key-bindings/remappings
" -----------------------------------------------------------------------------
nnoremap <leader>cc  :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
nnoremap <leader>cd  :Ex<CR>
nnoremap <leader>nt  :tabnew<CR>
nnoremap <leader>vt  :vertical botright terminal<CR>
nnoremap <leader>st  :%s//g<Left><Left>
nnoremap <leader>tn  :tabnext<CR>
nnoremap <leader>tp  :tabprevious<CR>

" -----------------------------------------------------------------------------
" FZF (files) related key-bindings/remappings
" -----------------------------------------------------------------------------
nnoremap <leader>ff  :Files<CR>
nnoremap <leader>fo  :History<CR>
nnoremap <leader>fb  :Buffers<CR>

" -----------------------------------------------------------------------------
" Disable arrow keys
" -----------------------------------------------------------------------------
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exec 'nnoremap' key '<Nop>'
    exec 'vnoremap' key '<Nop>'
endfor
