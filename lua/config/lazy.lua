-- Mise en place et installation de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configuration de lazy.nvim et importation du répertoire `plugins`
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  {
    -- Plugin spécifique
    "nvim-lualine/lualine.nvim", -- Exemple de plugin
    config = function()
      require("lualine").setup()
    end,
  },
})

-- Configuration globale pour lazy.nvim
require("lazy").setup({
  checker = {
    enabled = true,
    notify = false,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  change_detection = {
    notify = false,
  },
})

