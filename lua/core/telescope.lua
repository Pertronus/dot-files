require("telescope").setup {
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
require("telescope").load_extension "file_browser"
