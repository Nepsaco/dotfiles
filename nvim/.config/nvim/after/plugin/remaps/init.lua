local Remap = require('nepsaco.keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap('<leader>pv', ':Ex<CR>')
inoremap('jj', '<Esc>')
vnoremap('<C-c>', '"+y') 

-- Buffer management
nnoremap('<leader>d', ':bdelete<CR>')
nnoremap('<Leader>D', ':bdelete!<CR>')
nnoremap('<Leader><Tab>', ':b#<CR> ')

-- Split navigation
nnoremap('<C-J>', '<C-W><C-J>') 
nnoremap('<C-K>', '<C-W><C-K>') 
nnoremap('<C-L>', '<C-W><C-L>') 
nnoremap('<C-H>', '<C-W><C-H>') 
