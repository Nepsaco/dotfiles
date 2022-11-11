-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Navigation
    use("nvim-telescope/telescope.nvim")
    use "nvim-lua/plenary.nvim"
    use("nvim-lua/popup.nvim")

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use("romgrk/nvim-treesitter-context")
    use("nvim-treesitter/playground")

    -- Colorschemes
    use 'folke/tokyonight.nvim'


    -- Style
    use 'airblade/vim-gitgutter'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use 'mileszs/ack.vim'

    use 'vim-test/vim-test'
    use 'preservim/vimux'

    -- Editing
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'junegunn/vim-peekaboo'
    use 'thinca/vim-qfreplace'

    -- General
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'editorconfig/editorconfig-vim'
end)
