local config = {
	fg_color = "#ebdbb2",
	bg_color = "#cc241d",
	NeoColumn = "120",
	always_on = true,
	custom_NeoColumn = {},
	excluded_ft = { "text", "markdown", "csv" },
}

require("NeoColumn").setup(config)
