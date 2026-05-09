return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 100,
    opts = {
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true },
      },
      -- Choice of filter below!
      -- -- Available choices are:
      -- pro, octagon, machine, ristretto, spectrum, classic
      filter = "octagon",
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd.colorscheme("monokai-pro")
    end,
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
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false, -- Teman ska laddas direkt vid start
    priority = 1000, -- Hög prioritet så det laddas innan andra UI-element
    opts = {
      dark_style_background = "default", -- 'default', 'dark', eller 'transparent'
      light_style_background = "default",
      -- Här kan du lägga till fler specifika inställningar för just detta tema
    },
  },
}
