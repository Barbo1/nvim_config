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
