# Setup fzf
# ---------
if [[ ! "$PATH" == */var/home/stan/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/var/home/stan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/var/home/stan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/var/home/stan/.fzf/shell/key-bindings.zsh"
