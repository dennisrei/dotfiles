local M = {}


M.config = function()
  local lvim_lsp = require("lvim.lsp")
  local metals_config = require("metals").bare_config()

  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run or Test Target",
      metals = {
        runType = "runOrTestFile",
        envFile = ".env"
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }


  metals_config.on_init = lvim_lsp.common_on_init
  metals_config.on_exit = lvim_lsp.common_on_exit
  metals_config.capabilities = lvim_lsp.common_capabilities()
  metals_config.on_attach = function(client, bufnr)
    lvim_lsp.common_on_attach(client, bufnr)
    require("metals").setup_dap()
  end
  metals_config.settings = {
    -- serverVersion = "latest.snapshot",
    superMethodLensesEnabled = true,
    showImplicitArguments = true,
    showInferredType = true,
    showImplicitConversionsAndClasses = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }
  metals_config.init_options.statusBarProvider = "show-message"
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function() require("metals").initialize_or_attach(metals_config) end,
    group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
  })

  ----NVIM-METALS EXAMPLE CONFIG-----
  local map = vim.keymap.set
  vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
  -- LSP mappings
  lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
  map("n", "gD",  vim.lsp.buf.definition)
  map("n", "K",  vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gds", vim.lsp.buf.document_symbol)
  map("n", "gws", vim.lsp.buf.workspace_symbol)
  map("n", "<leader>cl", vim.lsp.codelens.run)
  map("n", "<leader>sh", vim.lsp.buf.signature_help)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>f", vim.lsp.buf.format)
  map("n", "<leader>ca", vim.lsp.buf.code_action)

  map("n", "<leader>ws", function()
    require("metals").hover_worksheet()
  end)

  -- all workspace diagnostics
  map("n", "<leader>aa", function()
    vim.diagnostic.setqflist()
  end)

  -- all workspace errors
  map("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
  end)

  -- all workspace warnings
  map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
  end)

  -- buffer diagnostics only
  map("n", "<leader>d", function()
    vim.diagnostic.setloclist()
  end)

  map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
  end)

  map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
  end)

  -- Example mappings for usage with nvim-dap. If you don't use that, you can
  -- skip these
  map("n", "<leader>dc", function()
    require("dap").continue()
  end)

  map("n", "<leader>dr", function()
    require("dap").repl.toggle()
  end)

  map("n", "<leader>dK", function()
    require("dap.ui.widgets").hover()
  end)

  map("n", "<leader>dt", function()
    require("dap").toggle_breakpoint()
  end)

  map("n", "<leader>dso", function()
    require("dap").step_over()
  end)

  map("n", "<leader>dsi", function()
    require("dap").step_into()
  end)

  map("n", "<leader>dl", function()
    require("dap").run_last()
  end)

  map("n", "<leader>mc", function()
    require("telescope").extensions.metals.commands()
  end)

end

return M
