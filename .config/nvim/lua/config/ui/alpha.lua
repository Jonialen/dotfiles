-- [[ Configure Alpha Dashboard ]]
-- See `:help alpha`

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Cabecera del Dashboard (ASCII Art)
dashboard.section.header.val = {
	"███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██║   ██║██║   ██║██║██║╚██╔╝██║",
	"██║ ╚████║╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝",
}

-- Botones
dashboard.section.buttons.val = {
	dashboard.button("e", "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Buscar archivo", ":Telescope find_files <CR>"),
	dashboard.button("g", "  Buscar texto", ":Telescope live_grep <CR>"),
	dashboard.button("r", "  Archivos recientes", ":Telescope oldfiles <CR>"),
	dashboard.button("q", "  Salir", ":qa<CR>"),
}

-- Pie de página
local function footer()
	-- Aquí puedes añadir información dinámica si lo deseas
	return "github.com/jonialen/dotfiles"
end

dashboard.section.footer.val = footer()

-- Opciones de la cabecera
dashboard.section.header.opts.hl = "Type"
-- Opciones de los botones
dashboard.section.buttons.opts.hl = "Function"
-- Opciones del pie de página
dashboard.section.footer.opts.hl = "Comment"

-- Enviar la configuración a Alpha
alpha.setup(dashboard.opts)
