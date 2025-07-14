local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "windwp/nvim-autopairs" },
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "nvim-telescope/telescope.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-lualine/lualine.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
})
