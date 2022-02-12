local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                            oooo                                        ]],
  [[                            `888                                        ]],
  [[ooo. .oo.  .oo.    .oooo.    888 .oo.     oooooooo  .ooooo.  ooo. .oo.  ]], 
  [[`888P"Y88bP"Y88b  `P  )88b   888P"Y88b   d'""7d8P  d88' `88b `888P"Y88b ]], 
  [[ 888   888   888   .oP"888   888   888     .d8P'   888ooo888  888   888 ]],
  [[ 888   888   888  d8(  888   888   888   .d8P'  .P 888    .o  888   888 ]],
  [[o888o o888o o888o `Y888""8o o888o o888o d8888888P  `Y8bod8P' o888o o888o]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "haluk.github.io"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
