local pigeon = require("pigeon")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.termguicolors = false

vim.keymap.set("n", "<C-s>", "<cmd>write<cr>")

local sitepath = pigeon.deps.bootstrap()
require("mini.deps").setup({ path = { package = sitepath } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    require("mini.basics").setup()
end)