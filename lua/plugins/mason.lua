local ensure_installed = {
    "typescript-language-server",
    "prettier",

    "gopls",
    "gofumpt",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gomodifytags",
    "gci",
    "delve",

    "rust-analyzer",

    "html-lsp",
    "html-lsp",
    "tailwindcss-language-server",

    "lua-language-server",
    "stylua",

    "clangd",
    "clang-format",

    "shellcheck",
    "shfmt",
    "flake8",
}

local options = {
    ensure_installed = ensure_installed,

    max_concurrent_installers = 10,
}

return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = options,
        config = function(_, opts)
            require("mason").setup(opts)

            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },
}
