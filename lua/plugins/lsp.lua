return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts = opts or {}
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
      })

      local function goto_definition_direct()
        local params = vim.lsp.util.make_position_params(0, "utf-8")
        local responses = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000) or {}
        local seen = {}
        local locations = {}

        for _, response in pairs(responses) do
          local result = response.result
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
                end
              end
            end
          end
        end

        if #locations == 0 then
          vim.notify("No definition found", vim.log.levels.WARN)
          return
        end

        vim.lsp.util.show_document(locations[1], "utf-8", { reuse_win = true, focus = true })
      end

      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].keys = opts.servers["*"].keys or {}
      table.insert(opts.servers["*"].keys, {
        "gd",
        goto_definition_direct,
        desc = "Goto Definition",
        has = "definition",
      })

      return opts
    end,
  },
}
