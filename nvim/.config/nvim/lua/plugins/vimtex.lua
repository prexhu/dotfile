return {
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_echo_verbose_input = 0

      vim.g.vimtex_compiler_latexmk = {
        continuous = 0,
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-8bit",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtext" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
  {
    "xuhdev/vim-latex-live-preview",
    lazy = false,
    init = function()
      vim.g.livepreview_engine = "xelatex"
    end,
  },
}
