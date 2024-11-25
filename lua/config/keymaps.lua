------- keymaps -------

-- move --

vim.keymap.set('x', '<S-Up>', ':MoveBlock -1<CR>', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Down>', ':MoveBlock 1<CR>', { noremap = true, silent = true })

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
