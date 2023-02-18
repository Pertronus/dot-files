local tele = require("telescope")

tele.setup {
   extensions = {
      file_browser = {
         theme = "ivy",
         hijack_netrw = true,
         mappings = {
            ["i"] = {
               -- TODO(Hayes): Mappings
            },
            ["n"] = {
               -- TODO(Hayes): Mappings
            },
         },
      },
   },
}
tele.load_extension("file_browser")
tele.load_extension("dap")
tele.load_extension("i23")
