local telescope = require('telescope')
telescope.setup{
   pickers = {
     file_browser = {
       hidden = true, -- shows hidden files
     }
   }
 }

telescope.load_extension('fzy_native')
telescope.load_extension('projects')
