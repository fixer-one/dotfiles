return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "open a float terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "open a horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "open a vertical terminal" },
	},
	config = true,
}
