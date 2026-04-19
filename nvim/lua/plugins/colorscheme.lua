return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load super early
    init = function()
      local ok, m = pcall(require, "catppuccin.groups.integrations.bufferline")
      if ok and m and m.get_theme and m.get == nil then
        m.get = m.get_theme
      end
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
