return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      --{ paths = "~/.config/nvim/lua/plugins/snippets" }
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/plugins/snippets" })
    end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  {
    "nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      config = function()
        require("cmp").setup({
          snipppet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          sources = {
            { name = "luasnip", option = { use_show_condition = true } },
          },
        })
      end,
    },
  },
  {
    "nvim-cmp",
  -- stylua: ignore
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
  },
}
