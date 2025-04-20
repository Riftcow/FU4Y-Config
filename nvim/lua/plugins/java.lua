return {
	{
		"mfussenegger/nvim-jdtls", -- Java LSP support
		dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		ft = { "java" }, -- Load only for Java files
		config = function()
			require("jdtls").start_or_attach({
				cmd = { "jdtls" },
				root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" }),
			})
		end,
	},
}
