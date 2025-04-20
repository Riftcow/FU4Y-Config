local lspconfig = require("lspconfig")

lspconfig.jdtls.setup({
	cmd = { os.getenv("USERPROFILE") .. "\\scoop\\apps\\jdtls\\current\\bin\\jdtls" },
	root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" }),
})
