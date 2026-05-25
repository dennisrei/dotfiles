vim.o.hlsearch = false
vim.opt.tabstop = 2
lvim.log.level = "info"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.scala", "*.sbt", "*.rs", "*.toml", "*.yaml", "*.yml", "*.lua", "*.py" }

lvim.colorscheme = "moonfly"
-- lvim.colorscheme = "onedark"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.view.adaptive_size = false
lvim.icons.ui.Folder = "󰉋"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.default = lvim.icons.ui.Folder

local t_actions = require("telescope.actions")
local t_action_state = require("telescope.actions.state")
lvim.builtin.telescope = {
  active = true,
  defaults = {
    file_ignore_patterns = { ".git/", ".idea/", ".bloop/", ".bsp/", "target/" },
    layout_strategy = "horizontal",
    path_display = { truncate = 2 },
    mappings = {
      i = {
        ["<CR>"] = function(pb)
          local picker = t_action_state.get_current_picker(pb)
          local multi = picker:get_multi_selection()
          t_actions.select_default(pb) -- the normal enter behaviour
          for _, j in pairs(multi) do
            if j.path ~= nil then      -- is it a file -> open it as well:
              vim.cmd(string.format("%s %s", "edit", j.path))
            end
          end
        end,
      }
    }
  }
}

-- lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
-- lvim.builtin.telescope.defaults.layout_config.width = 0.75
-- lvim.builtin.telescope.defaults.layout_config.horizontal.mirror = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "json",
  "lua",
  "python",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
lvim.plugins = {
  { "tanvirtin/monokai.nvim" },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    config = function()
      require("user.metals").config()
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    config = require("user.rust2").config()
  },
  { "szw/vim-maximizer" },
  { 'tomasiser/vim-code-dark' },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = false }
    end,
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
end

vim.opt.iskeyword:append({ '-', '_' })
lvim.builtin.which_key.mappings['c'] = {}
lvim.builtin.which_key.mappings['f'] = {}
lvim.builtin.which_key.mappings["q"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["<space>"] = {
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore=true})<CR>", "Find Files"
}
lvim.builtin.which_key.mappings["fg"] = {
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live Grep" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>lua require('telescope.builtin').grep_string()<CR>",
  "Search Current Word" }
lvim.builtin.which_key.mappings["fr"] = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Run Commands" }
lvim.builtin.which_key.mappings["fj"] = { "<cmd>lua require('user.egemen').find_in_dependency_jars()<CR>",
  "Find in Jar Dependencies" }
-- lvim.builtin.which_key.mappings["f"] = { "<cmd>lua require('user.egemen').insert_for_comprehension()<CR>", "For Comprehension" }
lvim.builtin.which_key.mappings["x"] = { "<cmd>MaximizerToggle<CR>", "Window Maximizer Toggle" }
