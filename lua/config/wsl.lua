if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win_clipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe Get-Clipboard",
      ["*"] = "powershell.exe Get-Clipboard",
    },
    cache_enabled = 0,
  }
  vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "p", '"+p', { noremap = true, silent = true })
end
