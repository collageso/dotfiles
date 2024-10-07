return {
	"mfussenegger/nvim-jdtls",
	dependencies = { "folke/which-key.nvim" },
	ft = "java", -- Java 파일 타입 설정
	opts = function()
		local mason_registry = require("mason-registry")
		local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"

		return {
			-- How to find the root dir for a given filename.
			root_dir = function(fname)
				return require("lspconfig").util.root_pattern(".git", "pom.xml", "build.gradle")(fname)
					or vim.fn.getcwd()
			end,

			-- How to find the project name for a given root dir.
			project_name = function(root_dir)
				return root_dir and vim.fs.basename(root_dir)
			end,

			-- Where are the config and workspace dirs for a project?
			jdtls_config_dir = function(project_name)
				return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
			end,

			jdtls_workspace_dir = function(project_name)
				return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
			end,

			-- How to run jdtls.
			cmd = {
				vim.fn.exepath("jdtls"),
				string.format("--jvm-arg=-javaagent:%s", lombok_jar),
			},

			full_cmd = function(opts)
				local fname = vim.api.nvim_buf_get_name(0)
				local root_dir = opts.root_dir(fname)
				local project_name = opts.project_name(root_dir)
				local cmd = vim.deepcopy(opts.cmd)
				if project_name then
					vim.list_extend(cmd, {
						"-configuration",
						opts.jdtls_config_dir(project_name),
						"-data",
						opts.jdtls_workspace_dir(project_name),
					})
				end
				return cmd
			end,

			-- DAP configuration
			dap = { hotcodereplace = "auto", config_overrides = {} },
			dap_main = {},
			test = true,

			settings = {
				java = {
					inlayHints = {
						parameterNames = {
							enabled = "all",
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local mason_registry = require("mason-registry")
		local bundles = {}

		if opts.dap and mason_registry.is_installed("java-debug-adapter") then
			local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
			local java_dbg_path = java_dbg_pkg:get_install_path()
			local jar_patterns = {
				java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
			}

			if opts.test and mason_registry.is_installed("java-test") then
				local java_test_pkg = mason_registry.get_package("java-test")
				local java_test_path = java_test_pkg:get_install_path()
				vim.list_extend(jar_patterns, {
					java_test_path .. "/extension/server/*.jar",
				})
			end

			for _, jar_pattern in ipairs(jar_patterns) do
				for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
					table.insert(bundles, bundle)
				end
			end
		end

		local function attach_jdtls()
			local fname = vim.api.nvim_buf_get_name(0)
			local config = {
				cmd = opts.full_cmd(opts),
				root_dir = opts.root_dir(fname),
				init_options = {
					bundles = bundles,
				},
				settings = opts.settings,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}
			require("jdtls").start_or_attach(config)
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = attach_jdtls,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "jdtls" then
					if opts.dap then
						require("jdtls").setup_dap(opts.dap)
					end
				end
			end,
		})

		attach_jdtls()
	end,
}
