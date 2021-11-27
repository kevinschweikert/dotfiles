local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'saadparwaiz1/cmp_luasnip'
	use 'joshdick/onedark.vim'
	use {
	  'hoob3rt/lualine.nvim',
		  requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'ryanoasis/vim-devicons'
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} , {'nvim-telescope/telescope-fzy-native.nvim'}}
	}
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = 'kyazdani42/nvim-web-devicons'
	}
    use 'christoomey/vim-tmux-navigator'
    use 'mattn/emmet-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'folke/trouble.nvim'
    use 'windwp/nvim-autopairs'
    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
    use 'rcarriga/nvim-notify'
    use 'ahmedkhalf/project.nvim'
-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
