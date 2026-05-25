return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = vim.NIL, -- Verwijdert async-trait uit de ignore lijst
            },
          },
        },
      },
    },
  },
}
