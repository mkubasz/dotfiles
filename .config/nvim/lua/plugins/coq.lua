vim.g.coq_settings = {
  auto_start = true,
  clients = {
    tabnine = {
      enabled = true,
    }
  }
}

require'lspinstall'.setup()
local lsp = require('lspconfig')
local coq = require('coq')
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  lsp.pyright.setup(coq.lsp_ensure_capabilities()) 
  lsp.bashls.setup(coq.lsp_ensure_capabilities())
  lsp.denols.setup(coq.lsp_ensure_capabilities())
  lsp.tsserver.setup(coq.lsp_ensure_capabilities())
end
