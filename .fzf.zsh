# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/masayoshi/.vim/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/masayoshi/.vim/dein/repos/github.com/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/masayoshi/.vim/dein/repos/github.com/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/masayoshi/.vim/dein/repos/github.com/junegunn/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,tmp} --type f"
