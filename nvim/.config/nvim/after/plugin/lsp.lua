local Remap = require("cyfork.keymap")
local nnoremap = Remap.nnoremap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
            nnoremap("<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>")
            nnoremap("[d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
            nnoremap("]d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
            nnoremap("<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            nnoremap("<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>")
            nnoremap("<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        end,
    }, _config or {})
end

require("lspconfig").intelephense.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").html.setup(config())

require("lspconfig").tsserver.setup(config())

require("lspconfig").pyright.setup(config())
