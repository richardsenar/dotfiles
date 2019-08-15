# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh
export TERM=xterm-256color

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # load zsh-autosuggestions 
source "${HOME}/.zgen/zgen.zsh" # load zgen
zgen load miekg/lean

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# POWERLEVEL9K_MODE='awesome-patched'
# ZSH_THEME="powerlevel9k/powerlevel9k"

## Powerlevel9k Settings
# POWERLEVEL9K_HISTORY_BACKGROUND='green'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
# POWERLEVEL9K_STATUS_VERBOSE=true
# POWERLEVEL9K_TIME_FOREGROUND="249"
# POWERLEVEL9K_TIME_BACKGROUND="black"
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} \uE12E"
# POWERLEVEL9K_VCS_GIT_ICON='\uE1AA'
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uE1AA'
# POWERLEVEL9K_HIDE_BRANCH_ICON=true

# #Powerline
# if [ -d "$HOME/Library/Python/2.7/bin" ]; then
#     PATH="$HOME/Library/Python/2.7/bin:$PATH"
# fi

# zsh tmux settings
# ZSH_TMUX_AUTOSTART='true'

# Default username to hide "user@hostname" info
DEFAULT_USER=`whoami`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git zsh-autosuggestions )

# source $ZSH/oh-my-zsh.sh
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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export GOPATH=$HOME/Dropbox_Local/HUB/Projects/GoLang
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

#  exa aliasing
alias ls='exa'
alias l='exa -a'
alias ll='exa -lgh'
alias la='exa -lagh'
alias lt='exa -laT'
alias lf='l *(.)'
alias ld='l -d */'

alias ffiles='find * -type f'
alias srch='grep -vI "\x00" -- *'
alias srchr='grep -vIr "\x00" -- .'
alias rtf='pbpaste | pbcopy'
alias rems='for f in *; do mv "$f" "${f// /}"; done'
alias repu='for f in *; do mv "$f" "${f// /_}"; done'
alias usage='df -hl'
alias ytdl='youtube-dl --yes-playlist'
alias mygp='cd $GOPATH/src/github.com/rssenar'
alias columns='column -s"," -t'

alias hist='history'
alias py2='workon py2env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit'
alias py3='workon py3env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit'
alias jynb='workon py3env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit && jupyter notebook'
alias jygo='docker run -it -p 8888:8888 gopherdata/gophernotes-ds'
alias deac='deactivate'
alias gpath='cd $GOPATH/src'
alias proj='cd $HOME/Dropbox_Local/hub/Projects'
alias glog='git log --oneline -30 --graph --all --decorate'
alias media='cd /Volumes/Media\ Drive/Media/Movies/'
alias bnotes='code $HOME/Dropbox_Local/HUB/BASH_commands.sh'
alias bprof='code $HOME/.bash_profile'
alias gweather='curl wttr.in/~corona'

# Quicker navigation
alias home='cd $HOME'
alias desk='cd $HOME/Desktop/'
alias down='cd $HOME/Downloads/'
alias hub='cd $HOME/Dropbox_Local/HUB'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back='cd $OLDPWD'

# GoLang Settings
export GOBIN=$HOME/Dropbox_Local/HUB/Projects/GoLang/bin
export GOPATH=$HOME/Dropbox_Local/HUB/Projects/GoLang
export PATH=$HOME/Dropbox_Local/HUB/Projects/GoLang/bin:$PATH # golang bin
export PATH=/usr/local/bin:$PATH # homebrew scripts
export PATH=$HOME/bin:$PATH # myshell scripts

export GREP_OPTIONS='--color=auto'
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_172, x86_64`

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

export FCEDIT=nano

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/richardsenar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/richardsenar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/richardsenar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/richardsenar/google-cloud-sdk/completion.zsh.inc'; fi

# if [ "$TMUX" = "" ]; then tmux; fi

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit