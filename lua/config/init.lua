-- Is necessary for the images in neo-tree to download ImageMagick 7 or above, and 
-- download the JetBrains nerd fonts and put them in .local/share/fonts.

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
    "};"
  })
  vim.ui.input ({prompt = "Class name: "}, function (prompt)
    prompt = string.gsub (prompt, " ", "")
    if prompt ~= "" then
      vim.cmd ("+1,+12s/Name/"..prompt.."/g")
    end
  end)
  vim.cmd ("nohlsearch")
end)

-- git commands --

vim.api.nvim_create_user_command(
  "Grac",
  function ()
    vim.fn.system({"git", "add", vim.fn.expand("%")})
    vim.fn.system({"git", "rebase", "--continue"})
    print("Rebase continued.")
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command(
  "Ga",
  function ()
    vim.fn.system({"git", "add", vim.fn.expand("%")})
    vim.cmd("redraw!")
    print("Added this file.")
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command (
  "Gcp",
  function (args)
    local name = args.fargs[1]
    if name then
      vim.fn.system({"git", "commit", "-m", name})
      vim.fn.system({"git", "push"})
      vim.cmd("redraw!")
      print("Commited and pushed.")
    else
      print("No commit name introduced.")
    end
  end,
  {nargs = 1}
)

vim.api.nvim_create_user_command(
  "Gc",
  function (args)
    local name = args.fargs[1]
    if name then
      print(vim.fn.system({"git", "commit", "-m", name}))
      vim.cmd("redraw!")
    else
      print("No commit name introduced.")
    end
  end,
  {nargs = 1}
)

vim.api.nvim_create_user_command(
  "Gp",
  function ()
    vim.fn.system({"git", "push"})
    vim.cmd("redraw!")
    print("Pushed.")
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command(
  "Gpf",
  function ()
    vim.fn.system({"git", "push", "--force-if-includes", "--force-with-lease"})
    vim.cmd("redraw!")
    print("Pushed.")
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command(
  "Gs",
  function ()
    local status_info = vim.fn.system({"git", "status", "-s"})
    vim.api.nvim_out_write(status_info)
  end,
  {nargs = 0}
)

------- -------

return {}
