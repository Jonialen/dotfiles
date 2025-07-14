# Guía de Uso para la Configuración de Neovim

Este documento describe los pasos de instalación, los atajos de teclado principales y las funcionalidades clave de esta configuración de Neovim.

## 1. Instalación

1.  **Clona el repositorio**:
    Necesitas clonar esta configuración en tu directorio `~/.config/nvim`.
    ```bash
    git clone <URL-del-repositorio> ~/.config/nvim
    ```

2.  **Inicia Neovim**:
    La primera vez que inicies Neovim, el gestor de plugins `lazy.nvim` se instalará y descargará automáticamente todos los plugins definidos en la configuración.
    ```bash
    nvim
    ```

## 2. Tecla Líder (Leader Key)

La tecla líder es una tecla principal que se usa en combinación con otras para ejecutar comandos. En esta configuración, la tecla líder es `Espacio`.

**A partir de ahora, `<leader>` se referirá a la tecla `Espacio`.**

## 3. Atajos de Teclado Principales

Aquí tienes una lista de los atajos más importantes, agrupados por funcionalidad.

### Generales y Edición
- **Guardar archivo**: `<leader>w`
- **Salir de Neovim**: `<leader>q`
- **Copiar al portapapeles del sistema**:
  - `y` (en modo visual) para copiar la selección.
  - `yy` (en modo normal) para copiar la línea actual.
- **Seleccionar todo el archivo**: `<leader>al`
- **Copiar todo el contenido del archivo**: `<leader>ay`

### Gestión de Archivos (NvimTree y Telescope)
- **Abrir/Cerrar el explorador de archivos**: `<leader>e`
- **Buscar archivos en el proyecto**: `<leader>ff` (Usa Telescope)
- **Buscar texto en todo el proyecto (Live Grep)**: `<leader>fg` (Usa Telescope)

### Navegación de Código (LSP)
- **Ir a la definición** de una variable o función: `gd`
- **Ir a la declaración**: `gD`
- **Ir a la implementación**: `gi`
- **Mostrar todas las referencias**: `gr`
- **Mostrar documentación flotante**: `K` (mantén el cursor sobre el símbolo)
- **Renombrar un símbolo** en todo el proyecto: `<leader>rn`
- **Mostrar acciones de código disponibles** (ej. "importar", "corregir"): `<leader>ca`
- **Formatear el código** del archivo actual: `<leader>fm`

### Diagnósticos (Errores y Advertencias)
- **Ver descripción del error** bajo el cursor: `<leader>i`
- **Ir al error siguiente**: `]d`
- **Ir al error anterior**: `[d`
- **Listar todos los errores del archivo actual**: `<leader>Q`
- **Buscar en todos los errores del proyecto**: `<leader>ld` (Usa Telescope)

## 4. Plugins Principales y Funcionalidades

- **lazy.nvim**: Gestor de plugins. Se encarga de instalar y cargar todo automáticamente.
- **nvim-treesitter**: Proporciona un resaltado de sintaxis más avanzado e inteligente.
- **telescope.nvim**: Un buscador "fuzzy" súper rápido para encontrar archivos, texto, diagnósticos y más.
- **nvim-tree.lua**: Un explorador de archivos moderno en forma de árbol.
- **nvim-lspconfig** y **mason.nvim**: Configuran el Language Server Protocol (LSP) para darte autocompletado, diagnósticos y navegación de código inteligente. Mason ayuda a instalar los servidores de lenguaje que necesites (ej. `pyright` para Python, `tsserver` para TypeScript).
- **nvim-cmp**: Motor de autocompletado que se integra con el LSP.
- **gitsigns.nvim**: Añade indicadores en el lateral para mostrar las líneas añadidas, modificadas o eliminadas según Git.
- **Comment.nvim**: Permite comentar y descomentar líneas o bloques de código fácilmente (normalmente con `gcc` para una línea o `gc` en modo visual).
- **nvim-autopairs**: Cierra automáticamente paréntesis, corchetes, comillas, etc.
