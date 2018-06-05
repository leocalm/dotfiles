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

# Powerlevel9k
POWERLEVEL9K_MODE=awesome-fontconfig
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status pyenv nvm ram root_indicator background_jobs history time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M %m.%d.%y}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_VERBOSE=false

#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'

#POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
antigen theme robbyrussell
#antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

