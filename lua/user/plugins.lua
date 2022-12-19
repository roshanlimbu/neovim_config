local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
)
  
-- Install your plugins here
return packer.startup(function(use)
  

  -- My plugins here

  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- misc
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use 'nvim-lualine/lualine.nvim' --statusline
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'windwp/nvim-autopairs' --auto pairs 
  use 'norcalli/nvim-colorizer.lua' --colorizer for the hex color codes
  -- use 'https://github.com/ap/vim-css-color' -- CSS colr preview

  -- use 'christoomey/vim-tmux-navigator' -- for navigating using h j k l  
  use 'szw/vim-maximizer' -- maximizes and restores current window
  use 'vim-scripts/ReplaceWithRegister' -- for replacing 

  --  colorschemes
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'lunarvim/colorschemes'
  use 'altercation/vim-colors-solarized'
  use 'catppuccin/nvim'
  use "EdenEast/nightfox.nvim" -- Packer
  use 'bluz71/vim-nightfly-guicolors' 



  --code completion
  use 'hrsh7th/nvim-cmp' --The completion plugin
  -- use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  -- use 'hrsh7th/cmp-cmdline' -- cmdline completions
  -- use 'hrsh7th/cmp-nvim-lsp'  -- nvim lsp for sources in cmp.lua
  use 'hrsh7th/cmp-nvim-lua' 
  use 'windwp/nvim-ts-autotag' -- Use treesitter to auto close and auto reaname html tags
  
  -- snippets
  -- use 'L3MON4D3/LuaSnip' --snippet engine
  use 'saadparwaiz1/cmp_luasnip' --snippet completions
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets
  use 'pangloss/vim-javascript' -- javaScript syntax
  
  --coc   
  use {'neoclide/coc.nvim', branch = 'release'}


  -- use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  -- use("williamboman/mason.nvim")
  -- use 'williamboman/mason-lspconfig.nvim' -- for installing lsp
  -- use 'neovim/nvim-lspconfig' -- configuring lsp servers
  -- use("jose-elias-alvarez/typescript.nvim") 
  -- use("onsails/lspkind.nvim")
  -- use({
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --       local saga = require("lspsaga")

  --       saga.init_lsp_saga({
  --           -- your configuration
  --       })
  --   end,
-- })
  use 'mlaursen/vim-react-snippets'
  
  -- File explorer
  use 'nvim-tree/nvim-tree.lua' -- portable file explorer

   -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use "nvim-lua/plenary.nvim" 
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use ({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Tree sitter
  use { 'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}
  use "p00f/nvim-ts-rainbow" -- Rainbow colorizer bracket

  -- surrounding plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary' -- For commenting

  -- vim which key
  use 'folke/which-key.nvim'

  -- git plugins
  use 'lewis6991/gitsigns.nvim'
  -- use 'tpope/vim-fugitive'

  -- BufferLine
  use 'akinsho/bufferline.nvim'

  -- ToggleTerm
  use 'akinsho/toggleterm.nvim'

  -- Impatient plugin for the faster load of plugins and modules
  use 'lewis6991/impatient.nvim'

  -- Fast and fully programmable greeter for Neovim
  use 'goolord/alpha-nvim'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
