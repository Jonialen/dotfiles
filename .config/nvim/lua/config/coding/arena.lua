-- [[ Configure arena.nvim ]]
-- See `:help arena.txt` for more information and configuration options.

require("arena").setup({
    -- The maximum number of files to display in the arena window.
    -- Set to `nil` for an unlimited number of items.
    max_items = 10,

    -- Always show the enclosing directory for these specific file names.
    always_context = { "mod.rs", "init.lua" },

    -- If set to true, the current buffer will not be listed in the arena window.
    ignore_current = false,

    -- Options to be applied to the arena buffer.
    buf_opts = {
        -- For example, you can uncomment the following line to disable relative line numbers.
        -- ["relativenumber"] = false,
    },

    -- When enabled, filters buffers based on the project they belong to.
    per_project = false,

    -- Adds file type icons to the buffers in the arena window.
    -- This requires the 'nvim-tree/nvim-web-devicons' plugin to be installed.
    devicons = true,

    -- Configuration for the arena window itself.
    window = {
        width = math.floor(vim.o.columns * 0.5),
        height = math.floor(vim.o.lines * 0.5),
        border = "rounded", -- Style of the floating window's border
        -- See :help nvim_open_win() for more details on these options.
        -- For example, you can set the following to customize the window position.
        -- row = 0.5,
        -- col = 0.5,
    },

    -- Keybindings for interacting with the arena window.
    keybinds = {
        -- Set any of these to `nil` to disable the default keybinding.
        ["<CR>"] = "open",
        ["d"] = "delete",
        ["D"] = "delete_all_unpinned",
        ["p"] = "pin",
        ["<C-v>"] = "open_vsplit",
        ["<C-x>"] = "open_hsplit",
        ["<C-t>"] = "open_tab",
    },
})
