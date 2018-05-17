# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z colored-man-pages zsh-syntax-highlighting zsh-history-substring-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# automatically upgrade itself without prompting
DISABLE_UPDATE_PROMPT=true


################# custom settings #######################

export PATH="/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

DEFAULT_USER=`whoami`

######## alias ########
alias upzsh="upgrade_oh_my_zsh_custom_plugins && upgrade_oh_my_zsh"

alias help="run-help"

alias pods="pod search"
alias podi="pod install --no-repo-update"
alias podu="date && pod update --no-repo-update && date"

alias svndel="svn delete"
alias svncommit="svn commit -m"
alias svnsetignore="svn propset svn:ignore"
alias svneditignore="svn propedit svn:ignore"
alias svngetignore="svn propget svn:ignore"

alias gitaddcommitpush="git add . && git commit -m \"`date`\" && git push origin $(git_current_branch)"

alias h="history"

if [ `uname` = 'Darwin' ];then
	alias l="ls -lahT"
fi

alias python2="/usr/bin/python2.7"
alias pip2="/usr/local/bin/pip2.7"
alias py="/usr/local/bin/python3"
alias python="/usr/local/bin/python3"
alias pip='/usr/local/bin/pip3'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ss="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;"

alias gla="gl -p"


######## 环境变量 ########
export SVN_EDITOR=vim
export EDITOR='subl -w'

######## 函数 ########
function cd(){
    newdir="$*"
    if [ $# -eq 0 ]; then
        newdir=${HOME};
    fi;
    builtin cd "$newdir" && l && pwd
}

function psa(){
    for app in $@
    do
        ps -ef | grep -i $app
    done
}

function psk(){
    psa $*
    echo -e '\n\nare you sure to kill these progresses [y/n]'

    read comfirm
    case $comfirm in
    y)
        for app in $@
        do
            ps -ef | grep -i $app | awk '{print $2}' | xargs kill -9
        done
        ;;
    *)
        echo 'give up'
        ;;
    esac
}

function upgrade_oh_my_zsh_custom_plugins() {
    oldPath=`pwd`

    pluginsPath=~/.oh-my-zsh/custom/plugins
    builtin cd $pluginsPath

    for plu in $pluginsPath/*; do
        echo $plu
	    builtin cd ${plu}
	    if [[ -d ".git" ]]; then
            git pull
   	    fi
    done

    builtin cd ${oldPath}
}

function gittagpush(){
	git tag -a $* -m '$*'
	git push --tags
}

function ox() {
    if [[ $# > 0 ]]; then
      cd $1
    fi

    project=`find . -name "*.xcworkspace" -maxdepth 1`
    if [[ ${#project} > 0 ]]; then
        open $project;
    else
        project=`find . -name "*.xcodeproj" -maxdepth 1`
        if [[ ${#project} > 0 ]]; then
            open $project;
        fi
    fi
}


export NVM_DIR="/Users/csz/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
