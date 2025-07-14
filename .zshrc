# Habilitar perfil de tiempo de carga
# zmodload zsh/zprof
# ========================
# ⏱ OPTIMIZACIÓN INICIAL
# ========================
# Idioma y editor
export LANG=en_US.UTF-8
export EDITOR='nvim'
export DATA="/mnt/datos/$USER"
# ========================
# ⚡ INSTANT PROMPT (opcional)
# ========================
# Habilitar instant prompt de Powerlevel10k (si lo usas)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# ========================
# 🧠 OH MY ZSH + PLUGINS
# ========================
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  archlinux
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)
source $ZSH/oh-my-zsh.sh
# ========================
# 🎨 POWERLEVEL10K
# ========================
# ZSH_THEME="powerlevel10k/powerlevel10k"
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# ========================
# ⚙️ STARSHIP (si lo prefieres al tema Powerlevel10k)
# ========================
eval "$(starship init zsh)"
# ========================
# 📦 NVM Lazy Load
# ========================
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}
for cmd in nvm node npm npx; do
  eval "${cmd}() { lazy_load_nvm; ${cmd} \"\$@\"; }"
done
# ========================
# 🧠 .nvmrc automático solo cuando cambias de carpeta
# ========================
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(pwd)/.nvmrc"
  if [ -f "$nvmrc_path" ]; then
    local desired=$(cat "$nvmrc_path")
    local current=$(nvm version 2>/dev/null)
    if [ "$desired" != "$current" ]; then
      nvm use "$desired" > /dev/null
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
# ========================
# 🔎 HISTORIAL
# ========================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# ========================
# 🛠️ ALIASES
# ========================
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias fastfetch='fastfetch -c ~/.config/fastfetch/config-compact.jsonc'
# ========================
# 📂 PATHS PERSONALIZADOS
# ========================
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export CHROME_EXECUTABLE=/usr/bin/chromium
export PATH="$HOME/.bun/bin:$PATH"

# ========================
# 🚀 FASTFETCH (decorativo)
# ========================
# fastfetch
# ========================
# 🔚 AVN (Node version auto-switcher)
# ========================
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"
# ========================
# 🕵️ PERFIL DE TIEMPO
# ========================
# zprof

# bun completions
[ -s "/home/jonialen/.bun/_bun" ] && source "/home/jonialen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/jonialen/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
