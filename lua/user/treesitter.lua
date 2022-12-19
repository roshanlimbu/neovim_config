local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
  sync_install = "false",

	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "typescript" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
	},

rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 80, -- Do not enable for files with more than n lines, int

    -- table of hex strings
     colors = {
                "#cc241d",
                "#a89984",
                "#b16286",
                "#d79921",
                "#689d6a",
                "#d65d0e",
                "#458588",

    },      termcolors = { -- table of colour name strings

                "Red",
                "Green",
                "Yellow",
                "Blue",
                "Magenta",
                "Cyan",
                "White",

    } 
  },


	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml" } },
})
