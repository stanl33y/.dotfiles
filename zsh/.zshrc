. $HOME/.asdf/asdf.sh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
  

export ZSH=$HOME/.zsh
source $ZSH/oh-my-zsh/oh-my-zsh.sh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh 
source $ZSH/p10k/p10k.zsh
source $ZSH/p10k/powerlevel10k/powerlevel10k.zsh-theme

#ZSH_THEME="dracul33"

plugins=(
  git
  npm # you added this
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=true

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7 '
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias arch='distrobox enter arch'
alias ubuntu='distrobox enter ubuntu'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
