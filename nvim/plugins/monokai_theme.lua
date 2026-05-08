return {
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
		dark_style_background = "default", -- "default", "dark", "transparent"
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Load the plugin
		config = function()
			require("gruvbox").setup({
				termcolors = 16,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				-- contrast happens below!
				contrast_dark = "hard",
				contrast_light = "hard",
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},

	-- Set theme as active in LazyVim
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "gruvbox",
			-- colorscheme = "monokai-pro",
			colorscheme = "monokai-nightasty",
		},
	},
}
