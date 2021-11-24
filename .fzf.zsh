# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/masayoshi_o/.vim/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/masayoshi_o/.vim/dein/repos/github.com/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/masayoshi_o/.vim/dein/repos/github.com/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/masayoshi_o/.vim/dein/repos/github.com/junegunn/fzf/shell/key-bindings.zsh"
