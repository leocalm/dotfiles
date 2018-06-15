# PATHS
export ZSH=$HOME/.oh-my-zsh
export MVN_ROOT="/opt/maven/bin"
export DATOMIC_INSTALL_DIR=/opt/datomic-free-0.9.5661
export PATH="$MVN_ROOT:$PATH"
export TERM="xterm-256color"
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_TMUX_AUTOSTART=true

# LOAD ANTIGEN
source /home/leonardo/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle command-not-found
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle chrissicool/zsh-256color

AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=cyan"
# antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme robbyrussell
# Tell Antigen that you're done.
antigen apply


export MVN_ROOT=/opt/maven/bin
export VSCODE_PATH=/opt/vscode/bin

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$MVN_ROOT:$VSCODE_PATH:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

