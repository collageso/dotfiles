return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("nvim-dap-virtual-text").setup({})

			-- dap.configurations.java = {
			-- 	{
			-- 		type = "java",
			-- 		request = "attach",
			-- 		name = "Debug (Attach) - Remote",
			-- 		hostName = "127.0.0.1",
			-- 		port = 5005,
			-- 	},
			-- }

			if not dap.adapters["pwa-node"] then
				require("dap").adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						-- 💀 Make sure to update this path to point to your installation
						args = {
							os.getenv("HOME")
								.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}
			end
			if not dap.adapters["node"] then
				dap.adapters["node"] = function(cb, config)
					if config.type == "node" then
						config.type = "pwa-node"
					end
					local nativeAdapter = dap.adapters["pwa-node"]
					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end

			local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

			local vscode = require("dap.ext.vscode")
			vscode.type_to_filetypes["node"] = js_filetypes
			vscode.type_to_filetypes["pwa-node"] = js_filetypes

			for _, language in ipairs(js_filetypes) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
						},
					}
				end
			end

			if not dap.adapters["codelldb"] then
				require("dap").adapters["codelldb"] = {
					type = "server",
					host = "127.0.0.1",
					port = "${port}",
					executable = {
						command = "codelldb",
						args = {
							"--port",
							"${port}",
						},
					},
				}
			end
			for _, lang in ipairs({ "c", "cpp" }) do
				dap.configurations[lang] = {
					{
						type = "codelldb",
						request = "launch",
						name = "Launch file",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
					},
					{
						type = "codelldb",
						request = "attach",
						name = "Attach to process",
						pid = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			-- vim.keymap.set("n", "<leader>dr", dap.run_to_cursor, { desc = "Run debug to the current cursor" })

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
			vim.keymap.set("n", "<leader>dt", function()
				dap.terminate()
				ui.close()
			end, { desc = "Debug Terminate" })
			vim.keymap.set("n", "<leader>d<F1>", dap.step_into, { desc = "Debug step into" })
			vim.keymap.set("n", "<leader>d<F2>", dap.step_over, { desc = "Debug step over" })
			vim.keymap.set("n", "<leader>d<F3>", dap.step_out, { desc = "Debug step out" })
			vim.keymap.set("n", "<leader>d<F4>", dap.step_back, { desc = "Debug step back" })
			vim.keymap.set("n", "<leader>d<F12>", dap.restart, { desc = "Debug restart" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open({})
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open({})
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close({})
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close({})
			end
		end,
	},
}
