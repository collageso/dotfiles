return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "ts_ls", "html", "cssls", "tailwindcss", "svelte" },
    automatic_enable = true
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    },
    "neovim/nvim-lspconfig",
  }
}
