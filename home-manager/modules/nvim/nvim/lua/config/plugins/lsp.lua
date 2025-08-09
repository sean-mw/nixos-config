return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.gopls.setup { capabilities = capabilities }
      lspconfig.nixd.setup { capabilities = capabilities }
      lspconfig.clangd.setup { capabilities = capabilities }
      lspconfig.pyright.setup { capabilities = capabilities }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end,
      })
    end,
  }
}
