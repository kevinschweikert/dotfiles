
-- import notify plugin safely
local status, notify = pcall(require, "notify")
if not status then
  print("Notify Plugin failed require")
	return
end

vim.notify = notify
