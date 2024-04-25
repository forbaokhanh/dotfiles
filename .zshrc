# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Timestamp history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Record Timestamps
setopt EXTENDED_HISTORY

# Clock in the terminal prompt
RPROMPT='[%D{%H:%M %d/%m}]'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git poetry zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Configure compiler environment variables for building Python with pyenv.

# LDFLAGS: Directs the linker to non-standard library locations necessary for linking the OpenSSL and Readline libraries.
# CPPFLAGS: Specifies additional include directories for the compiler to locate header files for OpenSSL and Readline.
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/readline/include"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export DEV="$HOME/dev"

[ -s "/Users/khanhtran/.scm_breeze/scm_breeze.sh" ] && source "/Users/khanhtran/.scm_breeze/scm_breeze.sh"

source $ZSH_CUSTOM/.aliases
alias edit_aliases='open $ZSH_CUSTOM/.aliases'

function wherealias() {
  local target_alias=$1
  local search_dirs=(~/.zshrc ~/.zshenv ~/.zprofile ~/.zlogin ~/.zshrc.d/ ~/.oh-my-zsh)
  for dir in "${search_dirs[@]}"; do
    if [ -d "$dir" ] || [ -f "$dir" ]; then
      grep -rl "alias $target_alias=" $dir
    fi
  done
}

# Homebrew location
export PATH=/opt/homebrew/bin:$PATH

# Function to neatly print and sort the PATH variable
ppath() {
    # Convert the colon-separated PATH string into an array
    local path_array=("${(@s/:/)PATH}")
  
    # Sort the array; you can customize this part for relevancy
    local sorted_path_array=("${(@o)path_array}")

    # Print each folder on a new line
    for folder in "${sorted_path_array[@]}"; do
        echo $folder
    done
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/khanhtran/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/khanhtran/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/khanhtran/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/khanhtran/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pyenv installation
# Configure pyenv for interactive and non-interactive login shells
export PYENV_ROOT="$HOME/.pyenv"
# Add pyenv to PATH only if it's not already present
if [[ ":$PATH:" != *":$PYENV_ROOT/bin:"* ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
# Initialize pyenv
eval "$(pyenv init -)"

# Created by `pipx` on 2024-03-28 14:48:21
export PATH="$PATH:/Users/khanhtran/.local/bin"