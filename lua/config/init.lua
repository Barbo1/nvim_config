-- Is necessary for the images in neo-tree to download ImageMagick 7 or above, and 
-- download the JetBrains nerd fonts and put them in .local/share/fonts.

------- configuration-------

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.g.mapleader = ' '

------- requires -------

require ("config.lazy")
require ("config.colors")
require ("config.lsp")
require ("config.treesitter")
require ("config.telescope")
require ("config.git_conf")
require ("config.keymaps")
-- require ("config.harpoon")

------- -------

return {}
