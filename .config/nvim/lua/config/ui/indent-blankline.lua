-- [[ Configure Indent Blankline ]]
-- See `:help indent_blankline.txt`

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	},
})
