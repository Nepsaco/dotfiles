local Remap = require('nepsaco.keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap('<leader>p', ':Ex<CR>')
inoremap('jj', '<Esc>')

