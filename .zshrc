# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# git clone into ~/.oh-my-zsh/custom/themes/
# https://github.com/bhilburn/powerlevel9k.git
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k ZSH theme
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv aws vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time dir_writable root_indicator background_jobs time)

# optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the "user@hostname" info when you’re logged in as yourself on your local machine.
DEFAULT_USER="daniel"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# git clone into ~/.oh-my-zsh/custom/plugins/
# https://github.com/zsh-users/zsh-syntax-highlighting.git
# https://github.com/frodenas/cf-zsh-autocomplete-plugin.git
plugins=(git python zsh-syntax-highlighting virtualenvwrapper autojump cf-zsh-autocomplete-plugin)

# User configuration

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$HOME/bin:/usr/local/bin:/opt/puppetlabs/bin:$HOME/apache-maven/bin:$PATH:$GOBIN
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

# some useful git aliases
alias g="git status"
alias gsh="git show"
alias gd="git diff"
alias ga="git add -A ."
alias gv="git commit -v"
alias gam="git commit --amend -v"
alias gfml="git add -A . && git commit --amend --no-edit && git push --force-with-lease"
alias gfr="git fetch && git rebase && tig"
alias gp="git push"
alias gpf="git push --force-with-lease"

# Customize to your needs...
# For Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

# Git variables
export GIT_AUTHOR_NAME="Daniel van Dorp"
export GIT_AUTHOR_EMAIL="daniel.van.dorp@mendix.com"
export GIT_COMMITTER_NAME="Daniel van Dorp"
export GIT_COMMITTER_EMAIL="daniel.van.dorp@mendix.com"

# Debian variables
DEBEMAIL="daniel.van.dorp@mendix.com"
DEBFULLNAME="Daniel van Dorp"
export DEBEMAIL DEBFULLNAME

# For SSH Host Completion - Zsh Style
# use ~/dev/mendix/puppy/allemaal, ~/.ssh/known_hosts and /etc/hosts for hostname completion
[ -r ~/dev/mendix/puppy/allemaal ] && _mx_hosts=($(<$HOME/dev/mendix/puppy/allemaal)) || _mx_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_mx_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  `hostname`
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Powerline, via https://gist.github.com/mrkara/68c6435f019136acd8db93546cff22e7
if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi

# CF CLI plugins
# https://github.com/ECSTeam/cloudfoundry-top-plugin
