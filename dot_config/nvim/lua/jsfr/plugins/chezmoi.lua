return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local chezmoi = require("chezmoi")

		chezmoi.setup({})
	end,
}
