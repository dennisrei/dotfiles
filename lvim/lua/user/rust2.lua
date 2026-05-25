local M = {}
 
M.config = function()
  vim.g.rustaceanvim = {
    tools = {
    },
    server = {
      on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        vim.keymap.set("n", "<C-space>", vim.lsp.codelens.run, { buffer = bufnr })
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
        vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
        vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      end,
      default_settings = {
        ['rust-analyzer'] = {
        },
      },
    },
    dap = {
    },
  }
end
 
return M
