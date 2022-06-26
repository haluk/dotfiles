local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- web
  b.formatting.deno_fmt,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Python
  b.formatting.black

}

-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       -- apply whatever logic you want (in this example, we'll only use null-ls)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end
--
-- -- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- local M = {}
--
-- M.setup = function()
--   null_ls.setup {
--     debug = true,
--     sources = sources,
--
--
--     on_attach = function(client, bufnr)
--       if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--           group = augroup,
--           buffer = bufnr,
--           callback = function()
--             lsp_formatting(bufnr)
--           end,
--         })
--       end
--     end,
--   }
-- end
local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
