-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",

	hl_override = {
	  Comment = { italic = true },
	  ["@comment"] = { italic = true },
	},

  statusline = {
    theme = "vscode_colored"
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "███╗   ██╗ ██████╗ ██╗██████╗ ",
      "████╗  ██║██╔═══██╗██║██╔══██╗",
      "██╔██╗ ██║██║   ██║██║██████╔╝",
      "██║╚██╗██║██║   ██║██║██╔══██╗",
      "██║ ╚████║╚██████╔╝██║██║  ██║",
      "╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═╝",
    }
  },
}

return M
