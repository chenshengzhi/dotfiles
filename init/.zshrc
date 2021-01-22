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
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

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
plugins=(git git-open z colored-man-pages zsh-syntax-highlighting encode64 sublime zsh-autosuggestions)

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# User configuration

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

export PATH="/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.fastlane/bin:$PATH"

DEFAULT_USER=`whoami`

######## alias ########
alias upzsh="upgrade_oh_my_zsh_custom_plugins && omz update"

alias help="run-help"

alias pods="pod search"

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
alias cc="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"

alias gla="git pull -p"
alias gcmla="git checkout master; git pull -p"
alias gptags='git push origin --tags'
alias gpo="git push origin"
alias gmm="git merge master"
alias gito="git open"

alias cartuciOS="carthage update --cache-builds --platform iOS"

alias rm='trash -F'
alias subl='subl -w'
alias spmdep='xcodebuild -resolvePackageDependencies'

######## 环境变量 ########
export SVN_EDITOR=vim
export EDITOR='subl -w'

######## 函数 ########
function cd(){
    newdir="$*"
    if [ $# -eq 0 ]; then
        newdir=${HOME};
    fi;
    builtin cd "$newdir" && ls -lahT && pwd
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

function git_add_tag_and_push() {
    if [[ $# == 0 ]]; then
        echo 'must have tag name.'
    else
        git tag -a $* -m '$*'
        git push --tags
    fi
}

function git_commit_with_time_and_push() {
    git add .
    git commit -m "`date`"
    git push origin $(git_current_branch)
}

function gpod() {
    branch_name=''
    if [[ $# > 0 ]]; then
        branch_name=$1
    else
        branch_name="$(git_current_branch)"
    fi
    echo -e "Will delete remote branch: \"${branch_name}\". Press any key to continue."
    read comfirm
    if [[ $# > 0 ]]; then
        git push origin -d $1
    else
        git push origin -d "$(git_current_branch)"
    fi
}

function ox() {
    oldPath=`pwd`
    if [[ $# > 0 ]]; then
      cd $1
    fi

    project=`find . -name "*.xcworkspace" -maxdepth 1`
    if [[ ${#project} > 0 ]]; then
        open $project -a /Applications/Xcode.app;
    else
        project=`find . -name "*.xcodeproj" -maxdepth 1`
        if [[ ${#project} > 0 ]]; then
            open $project -a /Applications/Xcode.app;
        fi
    fi
    cd $oldPath
}

function o() {
    if [[ $# > 0 ]]; then
        open $*
    else
        open .
    fi
}

function podi() {
    begin=`date`
    pod install --no-repo-update
    echo ""
    echo "begin: $begin"
    echo "end:   `date`"
}

function podu() {
    begin=`date`
    pod update --no-repo-update
    echo ""
    echo "begin: $begin"
    echo "end:   `date`"
}

function podiu() {
    begin=`date`
    pod install --repo-update
    echo ""
    echo "begin: $begin"
    echo "end:   `date`"
}

function poduu() {
    begin=`date`
    pod update --repo-update
    echo ""
    echo "begin: $begin"
    echo "end:   `date`"
}

function sson() {
    ln -sf ~/.ssh/config-proxy-on ~/.ssh/config
    ln -sf ~/.gitconfig-proxy-on ~/.gitconfig
}

function ssoff() {
    ln -sf ~/.ssh/config-proxy-off ~/.ssh/config
    ln -sf ~/.gitconfig-proxy-off ~/.gitconfig
}

function gbdd() {
    if [[ `git symbolic-ref --short HEAD` != 'master' ]]; then
        git checkout master
        echo ''
        echo ''
    fi
    git pull --prune
    echo ''
    echo ''
    git branch --merged | egrep -v "(^\*|master|release|beta|develop)" | xargs git branch -d
}

function gbdl() {
    if [[ `git symbolic-ref --short HEAD` != 'master' ]]; then
        git checkout master
        echo ''
        echo ''
    fi
    echo ''
    echo ''
    git branch --merged | egrep -v "(^\*|master|release|beta|develop)" | xargs git branch -d
}

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.fastlane/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"

export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
export PATH="$HOME/.gem/bin:$PATH"


source ~/.bash_profile