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
antigen theme bhilburn/powerlevel9k powerlevel9k


# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$MVN_ROOT:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# MVN
export MVN_ROOT="/opt/maven/bin"

# DATOMIC
export DATOMIC_INSTALL_DIR=/opt/datomic-free-0.9.5661

# Custom Alias
alias datomic_prod="/opt/datomic-pro-0.9.5661/bin/console -p 9998 sql 'datomic:sql://?jdbc:mysql://pod001-production-seubarriga.ciuoqxapzjot.us-east-1.rds.amazonaws.com:3306/datomic?user=QuintoAndar&password=a7sjFYiRoeKLFXHYKwkJDanajC7dVTZv'"

# Tell Antigen that you're done.
antigen apply
