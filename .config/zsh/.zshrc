# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh Base Shell Config
## Histfile
HISTFILE=~/.cache/zhistfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
## Autocompletions
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls $realpath"
## Random
unsetopt beep

# FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Aliases
## Git
alias gi="git init"
alias ga="git add --patch"
alias gc="git commit"
alias gci="git commit -m 'init: Initial commit'"
alias gp="git push"
alias gpo="git push -u origin main"
## Configs
alias wconf="nvim ~/.config/waybar/config.jsonc"
alias hconf="nvim ~/.config/hypr/"
alias zconf="nvim ~/.config/zsh/.zshrc"
alias zenv="nvim ~/.config/zsh/.zshenv"
alias vconf="nvim ~/.config/nvim/"
## Other
alias anime="ani-cli"
alias solitaire="ttysolitaire --no-background-color"
alias news="newsboat -q"
alias reddit="tuir"
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias lg="lazygit"
alias ff="fastfetch"
alias startwin="sudo virsh start win10"

# Keybindings
bindkey -e
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Plugins
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "romkatv/powerlevel10k"
plug "Aloxaf/fzf-tab"
plug "MichaelAquilina/zsh-you-should-use"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
