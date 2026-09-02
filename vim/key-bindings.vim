" =============================================================================
" Custom key-bindings/remappings
" =============================================================================
"
" Author: Akshay Mestry <xa@mes3.dev>
" Created on: 13 December, 2017
" Last updated on: 31 August, 2026
"
" This file contains my custom key-bindings/remappings that I use for my code
" development.
"
" -----------------------------------------------------------------------------
" Space as the leader key
" -----------------------------------------------------------------------------
let mapleader = " "

" -----------------------------------------------------------------------------
" General key-bindings/remappings
" -----------------------------------------------------------------------------
nnoremap <leader>cc              :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
nnoremap <leader>cd              :Ex<CR>
nnoremap <leader>nt              :tabnew<CR>
nnoremap <leader>ve              :rightbelow vsplit<Space>
nnoremap <leader>vt              :vertical botright terminal<CR>
nnoremap <leader>st              :%s//g<Left><Left>
nnoremap <leader>tn              :tabnext<CR>
nnoremap <leader>tp              :tabprevious<CR>
nnoremap <silent> <Esc>          :nohlsearch<CR>

" -----------------------------------------------------------------------------
" FZF (files) related key-bindings/remappings
" -----------------------------------------------------------------------------
nnoremap <leader>fb              :Buffers<CR>
nnoremap <leader>ff              :call RootFiles()<CR>
nnoremap <leader>fg              :Rg<Space>
nnoremap <leader>fh              :History<CR>
nnoremap <leader>fr              :Files<CR>

" -----------------------------------------------------------------------------
" Insert mode related key-bindings/remappings
" -----------------------------------------------------------------------------
inoremap (                       ()<Left>
inoremap [                       []<Left>
inoremap {                       {}<Left>
inoremap "                       ""<Left>

" -----------------------------------------------------------------------------
" Disable arrow keys in normal and visual mode
" -----------------------------------------------------------------------------
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exec 'nnoremap' key '<Nop>'
    exec 'vnoremap' key '<Nop>'
endfor
