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
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "windwp/nvim-autopairs" },
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "nvim-telescope/telescope.nvim",    dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-lualine/lualine.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "dzfrias/arena.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.coding.arena")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("config.coding.null-ls")
        end,
    },
    { "L3MON4D3/luasnip" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.ui.indent-blankline")
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("config.ui.which-key")
        end,
    },
    { "sindrets/diffview.nvim" },
    {
        "goolord/alpha-nvim",
        config = function()
            require("config.ui.alpha")
        end,
    },
})
