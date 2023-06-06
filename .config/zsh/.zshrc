# Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Xinitrc
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep awesome || startx
fi

HISTFILE=~/.cache/zhistfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -e

# Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vim mode
bindkey -v
export KEYTIMEOUT=1
## In tab complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Change cursor shape for different vim modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins 
  echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q' 
preexec() { echo -ne '\e[5 q' ;}

# Plugins
source "$ZPLUG_HOME"/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "romkatv/powerlevel10k", as:theme, depth:1

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

# Use LF to switch directories
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s "^o" 'lfcd\n'

# Aliases
alias anime="ani-cli"
alias solitaire="ttysolitaire --no-background-color"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias zconf="nvim ~/.config/zsh/.zshrc"
alias zenv="nvim ~/.config/zsh/.zshenv"
alias systemUpdate="sudo pacman -Syu --noconfirm && paru -Sua --noconfirm"
alias vconf="nvim ~/.config/nvim/init.lua"
alias nvimplugins="nvim ~/.config/nvim/lua/ben/plugins/"
alias news="newsboat -q"
alias reddit="tuir"
alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias zshenv="nvim ~/.config/zsh/.zshenv"
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias awesomeconf="nvim ~/.config/awesome/rc.lua"
alias checkawesome="awesome -k ~/.config/awesome/rc.lua"
alias monero-wallet='monero-wallet-cli --log-file "$XDG_CACHE_HOME"/monero-cli.log --wallet-file=/home/ben/.local/share/monero/wallet/ben.keys'
alias mine="sudo xmrig -o pool.hashvault.pro:80 -u 4AoBfi1s1FYW8ZnTsLCm6pXfV9dPENG3hTGyri2nttFpC91fEuatN7QCxew5iKtTbmSchaePFx1mpQvZ2i2yT7g5JNsbtrs -k --tls --cpu-priority 5 --threads=8"
alias monerod='monerod --data-dir /mnt/stuff/monero'

# Path
export PNPM_HOME="/home/ben/.local/share/pnpm"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
