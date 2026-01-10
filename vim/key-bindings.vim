" ============================================================================
" Custom key-bindings/remappings
" ============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 13 December, 2020
" Last updated on: 09 January, 2026
"
" This file contains my custom key-bindings/remappings that I use for my code
" development.
"
" ----------------------------------------------------------------------------
" Space (bar) as the leader key
" ----------------------------------------------------------------------------
let mapleader = " "

" ----------------------------------------------------------------------------
" General key-bindings/remappings
" ----------------------------------------------------------------------------
nnoremap <leader>cc  :set colorcolumn=79<CR>
nnoremap <leader>cd  :Ex<CR>
nnoremap <leader>nc  :set colorcolumn-=79<CR>
nnoremap <leader>r=  :vertical resize 82<CR>
nnoremap <leader>vt  :vertical botright terminal<CR>

" ----------------------------------------------------------------------------
" FZF (files) related key-bindings/remappings
" ----------------------------------------------------------------------------
nnoremap <leader>ff  :Files<CR>
nnoremap <leader>fo  :History<CR>
nnoremap <leader>fb  :Buffers<CR>
