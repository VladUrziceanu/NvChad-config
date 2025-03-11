-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}
local separators = {
  default = { left = "", right = "" },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}
local sep_l = separators["round"]["left"]


M.base46 = {
  theme = "gruvchad",
}

M.ui = {
  statusline = {
    modules = {
      cursor = function()
        return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %l-%c / %p%% "
      end
    },
  },
}

return M
