
------- options -------

vim.opt.tabstop = 2  
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.g.mapleader = ' '

------- requires -------

require ("config.lazy")
require ("config.colors")
require ("config.lsp")
require ("config.treesitter")
require ("config.fugitive")
require ("config.telescope")

------- keymaps -------

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move --

local opts = { noremap = true, silent = true }
vim.keymap.set('x', '<S-Up>', ':MoveBlock -1<CR>', opts)
vim.keymap.set('x', '<S-Down>', ':MoveBlock 1<CR>', opts)

-- for c/c++ --

vim.keymap.set ('n', '<leader>cls', function ()
  local row = unpack (vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines (0, row, row, 0, {
    "class Name {",
    "  private: ",
    "    ",
    "  public:",
    "    Name ();",
    "    Name (const Name &);",
    "    Name (Name &&);",
    "    Name & operator= (const Name &);",
    "    Name & operator= (Name &&);",
    "    bool operator== (const Name &);",
    "    ~Name ();",
    "    ",
    "};"})
  vim.ui.input ({prompt = "Class name: "}, function (prompt)
    prompt = string.gsub (prompt, " ", "")
    if prompt ~= "" then
      vim.cmd ("+1,+12s/Name/"..prompt.."/g")
    end
  end)
  vim.cmd ("nohlsearch")
end)

return {}

