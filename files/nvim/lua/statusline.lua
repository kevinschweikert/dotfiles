local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function filetype() return string.format(" %s ", vim.bo.filetype):upper() end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
  if fpath == "" or fpath == "." then return " " end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then return "" end
  return fname .. " "
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then return "" end
  return " %P %l:%c "
end

local function filesize()
  local size = vim.fn.getfsize(vim.fn.expand("%"))
  if size < 0 then return "" end
  if size < 1024 then
    return size .. "B "
  elseif size < 1024 * 1024 then
    return string.format("%.1fK", size / 1024)
  else
    return string.format("%.1fM", size / 1024 / 1024)
  end
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    "%#Statusline#",
    mode(),
    filetype(),
    filepath(),
    filename(),
    filesize(),
    "%=",
    lineinfo(),
  })
end

function Statusline.inactive() return " %F" end

local augroup = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = augroup,
  callback = function() vim.opt_local.statusline = "%!v:lua.Statusline.active()" end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = augroup,
  callback = function() vim.opt_local.statusline = "%!v:lua.Statusline.inactive()" end,
})
