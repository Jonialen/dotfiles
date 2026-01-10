# ========================
# 🌐 LOCALIZACIÓN Y BÁSICOS
# ========================
export LANG=en_US.UTF-8
export EDITOR='nvim'
export DATA="/mnt/datos/$USER"

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
  z
)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ========================
# 🌟 STARSHIP PROMPT
# ========================
command -v starship >/dev/null && eval "$(starship init zsh)"

# ========================
# 📦 NVM (Lazy Loading)
# ========================
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f nvm node npm npx yarn
  if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
  fi
}
for cmd in nvm node npm npx yarn; do
  eval "${cmd}() { lazy_load_nvm; ${cmd} \"\$@\"; }"
done

# ========================
# 🧭 HISTORIAL AVANZADO
# ========================
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS HIST_VERIFY

# ========================
# ⚙️ ALIASES
# ========================
if command -v lsd >/dev/null; then
  alias ls='lsd'
  alias l='lsd -l'
  alias la='lsd -la'
  alias lt='lsd --tree'
  alias ltr='lsd --tree -d 2'
else
  alias ls='ls --color=auto'
  alias l='ls -l'
  alias la='ls -la'
fi

alias update='sudo pacman -Syu && yay -Syu'
alias installed='pacman -Q | wc -l'
alias orphans='pacman -Qtdq'

alias g='git'
alias gst='git status'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'

command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# ========================
# 🧩 PATH Y VARIABLES DE ENTORNO
# ========================

# Rutas base primero (para que overrides tengan prioridad sobre /usr/bin)
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# Flutter
if [[ -d "/opt/flutter/bin" ]]; then
  export PATH="/opt/flutter/bin:$PATH"
fi

# Android SDK (sin Android Studio)
if [[ -d "/opt/android-sdk" ]]; then
  export ANDROID_HOME="/opt/android-sdk"
  export PATH="$PATH:$ANDROID_HOME/emulator"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/tools/bin"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
fi

# Chrome/Chromium (para Flutter Web)
if command -v chromium >/dev/null 2>&1; then
  export CHROME_EXECUTABLE="$(command -v chromium)"
fi

# Bun
if [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [[ -f "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
fi

# PNPM
if [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  [[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
fi

# OpenCode
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"

# ========================
# 🔧 FUNCIONES
# ========================
mkcd() { mkdir -p "$1" && cd "$1"; }

extract() {
  [[ -f $1 ]] || { echo "❌ Archivo inválido: $1"; return 1; }
  case $1 in
    *.tar.bz2) tar xjf "$1" ;; *.tar.gz) tar xzf "$1" ;; *.tar.xz) tar xf "$1" ;;
    *.bz2) bunzip2 "$1" ;; *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;; *.tar) tar xf "$1" ;;
    *.zip) unzip "$1" ;; *.7z) 7z x "$1" ;;
    *) echo "No sé extraer '$1'" ;;
  esac
}

hist() { history | grep -i "$1"; }

sysinfo() {
  echo "🖥️  $(uname -sr)"
  echo "⏰ Uptime: $(uptime -p)"
  echo "💾 Mem: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
  echo "💿 Disco: $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')"
  echo "🔥 CPU load: $(cut -d' ' -f1-3 /proc/loadavg)"
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ========================
# ⚡️ COMPLETIONS
# ========================
autoload -Uz compinit && compinit -C

zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:warnings' format 'No hay coincidencias para: %d'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache

# ========================
# 🖼️ FASTFETCH al iniciar
# ========================
fastfetchStart() {
  command -v fastfetch >/dev/null || return
  if (( COLUMNS < 80 )); then
    fastfetch -c ~/.config/fastfetch/config-compact.jsonc
  else
    fastfetch -c ~/.config/fastfetch/config.jsonc
  fi
}
fastfetchStart

# bun completions
[ -s "/home/jonialen/.bun/_bun" ] && source "/home/jonialen/.bun/_bun"
