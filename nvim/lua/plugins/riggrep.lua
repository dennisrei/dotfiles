return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({
        grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden",
        },
      })
    end,
  },
}
