return {
	-- nvim-dev-container
	-- Neovim dev-container support.
	{
		{ "esensar/nvim-dev-container", config = true },
	},
	-- Noice:
	-- Higly experemental plugin to replace the UI for the messages, cmd line and the popupmenu.
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- Noice setup.
	require("noice").setup({
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	}),
	-- Noice setup end;
	-- Harpoon:
	-- Fast file switch with harpoons targeting the files you are working on.
	-- Notice: Needs to be configurated. Check github!
	-- {
	--   "ThePrimeagen/harpoon",
	--   branch = "harpoon2",
	--   dependencies = { "nvim-lua/plenary.nvim" }
	-- },
}
