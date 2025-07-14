#!/bin/bash
# Cheatsheet en terminal flotante con column

CHEATSHEET_FILE="$HOME/.config/nvim/cheatsheet.txt"

# Verificar si el archivo existe
if [[ ! -f "$CHEATSHEET_FILE" ]]; then
    echo "Error: No se encontró el archivo $CHEATSHEET_FILE"
    exit 1
fi

# Cerrar ventana anterior si existe
pkill -f "floating_cheatsheet" 2>/dev/null

# Mostrar en terminal flotante con formato bonito
kitty --class="floating_cheatsheet" --title="Nvim Cheatsheet" \
    -e zsh -c "
    echo -e '\033[1;36m═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════\033[0m'
    echo -e '\033[1;35m                                                   NVIM CHEATSHEET                                                         \033[0m'
    echo -e '\033[1;36m═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════\033[0m'
    echo ''
    cat '$CHEATSHEET_FILE' | column -t -s '|' | sed 's/^/  /' | sed 's/TECLA/\x1b[1;33mTECLA\x1b[0m/g' | sed 's/DESCRIPCIÓN/\x1b[1;32mDESCRIPCIÓN\x1b[0m/g' | sed 's/COMANDO\/ACCIÓN/\x1b[1;31mCOMANDO\/ACCIÓN\x1b[0m/g'
    echo ''
    echo -e '\033[1;36m═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════\033[0m'
    echo -e '\033[1;34mPresiona cualquier tecla para salir...\033[0m'
    read -n 1
    "
