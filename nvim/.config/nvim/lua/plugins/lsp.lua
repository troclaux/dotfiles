local function goto_definition_direct()
	local bufnr = vim.api.nvim_get_current_buf()
	local seen = {}
	local locations = {}
	local encodings = {}

	-- each server counts columns in its own encoding (pyright and lua_ls use
	-- utf-16), so positions must be built and read per client
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/definition" })) do
		local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
		local response = client:request_sync("textDocument/definition", params, 1000, bufnr)
		local result = response and response.result
		if result then
			local items = vim.islist(result) and result or { result }
			for _, item in ipairs(items) do
				local uri = item.uri or item.targetUri
				local range = item.range or item.targetSelectionRange
				if uri and range then
					local key = table.concat({
						uri,
						range.start.line,
						range.start.character,
						range["end"].line,
						range["end"].character,
					}, ":")
					if not seen[key] then
						seen[key] = true
						locations[#locations + 1] = item
						encodings[#locations] = client.offset_encoding
					end
				end
			end
		end
	end

	if #locations == 0 then
		vim.notify("No definition found", vim.log.levels.WARN)
		return
	end

	vim.lsp.util.show_document(locations[1], encodings[1], { reuse_win = true, focus = true })
end

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				keys = { { "<Leader>M", "<cmd>Mason<CR>", desc = "Access Mason menu" } },
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
		-- every server installed through mason is enabled automatically,
		-- except stylua, which conform runs as a formatter
		opts = {
			ensure_installed = { "lua_ls", "pyright", "ruff" },
			automatic_enable = { exclude = { "stylua" } },
		},
		init = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
				underline = false,
				update_in_insert = false,
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method("textDocument/definition") then
						vim.keymap.set(
							"n",
							"gd",
							goto_definition_direct,
							{ buffer = args.buf, desc = "Goto Definition" }
						)
					end
				end,
			})
		end,
	},
}
