-- Add any servers here together with their settings
---@type lspconfig.options
local servers = {
  ansiblels = {},
  bashls = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  html = {},
  jsonls = {},
  powershell_es = {},
  pyright = {},
  rust_analyzer = {},
  terraformls = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

return servers
