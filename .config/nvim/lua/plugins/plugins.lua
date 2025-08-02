return{
    "folke/snacks.nvim",
	priority = 1000,
	lazy = false,
    ---@type snacks.Config
    opts = {
		picker = { enabled = true },
		statuscolumn = { enabled = true },
    },
	-- {
	--   "ibhagwan/fzf-lua",
	--   dependencies = { "nvim-tree/nvim-web-devicons" },
	--   opts = {}
	-- },
	{ "ctrlpvim/ctrlp.vim" },
	-- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
		tag = "0.1.8",
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },
	{
		"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"
	},
	{
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons" -- optional, but recommended
        },
        lazy = false -- neo-tree will lazily load itself
    },
	{
		'Shatur/neovim-session-manager'
	},
	{ 	'echasnovski/mini.nvim', version = '*' },
	-- {
	-- 	'goolord/alpha-nvim',
	-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- 	config = function ()
	-- 		require'alpha'.setup(require'alpha.themes.dashboard'.config)
	-- 	end
	-- },
	-- { 'joeytwiddle/sexy_scroller.vim' },
	{	'ryanoasis/vim-devicons'},
	{
	  "williamboman/mason.nvim",
	  dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	  },
	  config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
		  ensure_installed = { "ts_ls", "lua_ls" },
		})

		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
		  function(server_name)
			lspconfig[server_name].setup {}
		  end,
		})
	  end
	},
	
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require('tiny-inline-diagnostic').setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end
	},
  {
      'akinsho/toggleterm.nvim',
      config = true
  },
	{
	  "folke/trouble.nvim",
	  opts = {}, -- for default options, refer to the configuration section for custom setup.
	  cmd = "Trouble",
	  keys = {
		{
		  "<leader>xx",
		  "<cmd>Trouble diagnostics toggle<cr>",
		  desc = "Diagnostics (Trouble)",
		},
		{
		  "<leader>xX",
		  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		  desc = "Buffer Diagnostics (Trouble)",
		},
		{
		  "<leader>cs",
		  "<cmd>Trouble symbols toggle focus=false<cr>",
		  desc = "Symbols (Trouble)",
		},
		{
		  "<leader>cl",
		  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		  desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
		  "<leader>xL",
		  "<cmd>Trouble loclist toggle<cr>",
		  desc = "Location List (Trouble)",
		},
		{
		  "<leader>xQ",
		  "<cmd>Trouble qflist toggle<cr>",
		  desc = "Quickfix List (Trouble)",
		},
	  },
	},
	
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	
	{ "HiPhish/rainbow-delimiters.nvim" },
	
	{
	  "NeogitOrg/neogit",
	  dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	  },
	},
	
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
	
	{  "numToStr/Comment.nvim"	},
	
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  },
	  keys = {
		{
		  "<leader>?",
		  function()
			require("which-key").show({ global = false })
		  end,
		  desc = "Buffer Local Keymaps (which-key)",
		},
	  },
	},
	
	{'github/copilot.vim'},
	{'folke/todo-comments.nvim'},
	{'nvimtools/none-ls.nvim'},
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    opts = {},
  },
  {
    "EL-MASTOR/bufferlist.nvim",
    lazy = true,
    keys = { { "<Leader>b", ':BufferList<CR>', desc = "Open bufferlist" } },
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "BufferList",
    opts = { },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
	
	-- Autocompletion engine
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},

	-- Snippet engine
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},
  
  -- GIT
  {'tpope/vim-fugitive'},
  {'lewis6991/gitsigns.nvim'},
  
  -- Theme
	{  "olimorris/onedarkpro.nvim",  priority = 1000 },
	{  "ghifarit53/tokyonight-vim",  priority = 1000 },
	{  "RamilHinshaw/frostmint",  priority = 1000 },
	{  "RamilHinshaw/frostmint",  priority = 1000 },
	{  "tomasiser/vim-code-dark",  priority = 1000 },
	{  "luisiacc/handmade-hero-theme",  priority = 1000 },
	{  "chriskempson/vim-tomorrow-theme",  priority = 1000 },
	-- {'loctvl842/monokai-pro.nvim'},

}
