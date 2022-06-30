local status_ok, null_ls = pcall(require, "null-ls")
local format_on_save = false

if status_ok then
  local builtins = null_ls.builtins

  return {
    sources = {
      -- Completion
      -- builtins.completion.spell,
      -- Formatting
      builtins.formatting.yapf, -- Python
      builtins.formatting.black, -- Python
      builtins.formatting.isort, -- Python
      builtins.formatting.stylua, -- Lua
      builtins.formatting.shfmt, -- Shell
      builtins.formatting.sqlformat, -- SQL
      builtins.formatting.prettier.with {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "css",
          "scss",
          "html",
          "yaml",
          "markdown",
          "json",
        },
      },
      -- Linters
      builtins.diagnostics.eslint, -- Javascript
      builtins.diagnostics.flake8, -- Python
      builtins.diagnostics.tsc, -- Typescript
      builtins.diagnostics.shellcheck.with {
        diagnostics_format = "#{m} [#{c}]",
      },
      builtins.diagnostics.luacheck.with {
        extra_args = { "--global vim" },
      },
      -- Code Actions
      builtins.code_actions.gitsigns,
      builtins.code_actions.gitrebase,
      builtins.code_actions.shellcheck,
      -- Hover
      builtins.hover.dictionary,
    },
    on_attach = function(client)
      -- Format on save
      if format_on_save then
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = function()
              vim.lsp.buf.formatting_sync()
              -- vim.lsp.buf.formatting_sync(nil, 2000)
            end,
          })
        end
      end
    end,
  }
end
