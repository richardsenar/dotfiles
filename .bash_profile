# echo $(fortune)

# link .bash_profile to bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# z
. /usr/local/etc/profile.d/z.sh

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Notes
function nn(){
  nano $HOME/Dropbox_Local/Apps/Drafts/"$(date "+%Y-%m-%d-%H%M%S")_$(suuid)_$1.md"
}
function sn(){
    cd $HOME/Dropbox_Local/Apps/Drafts/ && grep -vI "\x00" -- * | grep -i "$1"
}
alias nnn='cd $HOME/Dropbox_Local/Apps/Drafts/ && ll'

# Send to System Notification
function _sys_notify() {
    local notification_command="display notification \"$2\" with title \"$1\""
    osascript -e "$notification_command"
}
alias sys-notify="_sys_notify $1 $2"

# terminal colors
red=$(tput setaf 124);
blue=$(tput setaf 33)
cyan=$(tput setaf 37);
green=$(tput setaf 64);
orange=$(tput setaf 167);
pink=$(tput setaf 197);
purple=$(tput setaf 125);
yellow=$(tput setaf 228);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);

# prompt
# PS1="\[${bold}\]\[${cyan}\][\s\v]"; # The version of Bash (e.g., 2.00)
# PS1+="\[${pink}\](\u)";
# PS1+="\[${white}\]:";
# PS1="\[${white}\]\w"; # The basename of $PWD. 
# PS1+="\[${white}\]\$(parse_git_branch)"; # git branch
# PS1+="\[${white}\]\n$ \[${reset}\]"; # '->' and reset colors

PS1="\w"; # The basename of $PWD. 
PS1+="\$(parse_git_branch)"; # git branch
PS1+="\n> "; # '->' and reset colors

# Aliases
# alias ll='ls -p'
# alias llf='ls -p | grep -v /'
# alias lld='ls -p | grep /$'
# alias lla='ls -lah'

#  exa aliasing
alias ls='exa'
alias l='exa -a'
alias ll='exa -lgh'
alias la='exa -lagh'
alias lt='exa -laT'

alias ffiles='find * -type f'
alias srch='grep -vI "\x00" -- *'
alias srchr='grep -vIr "\x00" -- .'
alias rtf='pbpaste | pbcopy'
alias rems='for f in *; do mv "$f" "${f// /}"; done'
alias repu='for f in *; do mv "$f" "${f// /_}"; done'
alias usage='df -hl'
alias ytdl='youtube-dl --yes-playlist'
alias mygp='cd $GOPATH/src/github.com/rssenar && ll'
alias columns='column -s"," -t'

alias hist='history'
alias py2='workon py2env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit && ll'
alias py3='workon py3env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit && ll'
alias jynb='workon py3env && cd $HOME/Dropbox_Local/hub/Projects/PyToolkit && jupyter notebook'
alias jygo='docker run -it -p 8888:8888 gopherdata/gophernotes-ds'
alias deac='deactivate'
alias gpath='cd $GOPATH/src && ll'
alias proj='cd $HOME/Dropbox_Local/hub/Projects'
alias glog='git log --oneline -30 --graph --all --decorate'
alias media='cd /Volumes/Media\ Drive/Media/Movies/ && ll'
alias bnotes='code $HOME/Dropbox_Local/HUB/BASH_commands.sh'
alias bprof='code $HOME/.bash_profile'
alias gweather='curl wttr.in/~corona'

# Quicker navigation
alias home='cd $HOME && ll'
alias desk='cd $HOME/desktop/ && ll'
alias hub='cd $HOME/Dropbox_Local/HUB && ll'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back='cd $OLDPWD'

alias df='df -hl' # display capacity local drives
alias du='du -h'
alias chrome="open -a 'Google Chrome'"
alias firefox="open -a 'Firefox'"

# Git
alias gs='git status'
alias ga='git add .'
# alias gc='git commit -m' # requires you to type a commit message
function gc(){
  git commit -m "$1"
}
alias gp='git push'

# GoLang Settings
export GOBIN=$HOME/Dropbox_Local/HUB/Projects/GoLang/bin
export GOPATH=$HOME/Dropbox_Local/HUB/Projects/GoLang
export PATH=$HOME/Dropbox_Local/HUB/Projects/GoLang/bin:$PATH # golang bin
export PATH=/usr/local/bin:$PATH # homebrew scripts
export PATH=$HOME/bin:$PATH # myshell scripts
export GREP_OPTIONS='--color=auto'
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_172, x86_64`

export PATH=/opt/local/bin:$PATH

shopt -s globstar # use: **/* to include all files recursively

# Python VirtualEnvWrapper Settings
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/richardsenar/Dropbox_Local/HUB/Projects/PyToolkit/yes/google-cloud-sdk/path.bash.inc' ]; then source '/Users/richardsenar/Dropbox_Local/HUB/Projects/PyToolkit/yes/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/richardsenar/Dropbox_Local/HUB/Projects/PyToolkit/yes/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/richardsenar/Dropbox_Local/HUB/Projects/PyToolkit/yes/google-cloud-sdk/completion.bash.inc'; fi

# # prompt
# # PS1="\[${bold}\]\[${cyan}\]\u"; # bold & username
# PS1="\[${bold}\]\[${cyan}\][\H]"; # bold & username
# # PS1+="\[${white}\] at ";
# # PS1+="\[${pink}\]\h"; # host
# PS1+="\[${pink}\]\s \v";
# # PS1+="\[${white}\] in ";
# PS1+="\[${yellow}\]: \W"; # working directory
# PS1+="\[${white}\]\$(parse_git_branch)"; # git branch
# # PS1+="\n";
# PS1+="\[${white}\] $ \[${reset}\]"; # '->' and reset colors
##
# Your previous /Users/richardsenar/.bash_profile file was backed up as /Users/richardsenar/.bash_profile.macports-saved_2018-06-30_at_09:39:26
##

# MacPorts Installer addition on 2018-06-30_at_09:39:26: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

