#!/bin/zsh
#
# Name: Jarod Luebbert
# Desc: Zsh config file.

# ------------------------------------------------------------------------
# GENERAL CONFIG
# ------------------------------------------------------------------------

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

REPORTTIME=10 # show elapsed time if command took more than X seconds
LISTMAX=0

autoload compinit
compinit

PROMPT='%n:%1~/: '
RPROMPT='%#'

# ------------------------------------------------------------------------
# ALIASES AND FUNCTIONS
# ------------------------------------------------------------------------

function take {
  mkdir $1
  cd $1
}

function mkprj {
  mkdir $1
  cd $1
  git init
  touch README.md
  git add .
  git commit -m "initial commit"
}

function mksite {
  mkdir $1
  cd $1
  git init
  touch index.html
  mkdir css
  mkdir images
  mkdir js
  touch css/master.css
  touch js/app.js
  git add .
  git commit -m "initial commit"
}

function djg {
  django-admin.py startproject $1
  mkprj $1
}

alias v='mvim'
alias p='cd ~/Projects'
alias w='cd ~/Sites'
alias h='cd ~'

alias m='make'
alias mc='make clean'
alias mr='make clean && make && find . -type f -perm -o+rx | sh'

# Git specific
alias gitrm='git ls-files --deleted | xargs git rm'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gi='git init && touch README.md'
alias gs='git status'
alias gc='git clone'
alias gp='git push'
alias gcm='git commit -m'
alias ga='git add'
alias gaa='git add .'

# Django specific
alias dj='django-admin.py startproject'
alias dja='django-admin.py startapp'
alias djs='python manage.py runserver'
alias djsh='python manage.py shell'
alias djv='python manage.py validate'
alias djdb='python manage.py syncdb'
alias djt='python manage.py test'

# Rails specific
alias sc='./script/console'
alias ss='./script/server'
alias sg='./script/generate'

# Disqus specific
alias disqus='cd ~/Sites && workon disqus'

# JavaScript
alias rhino='java -jar /usr/share/java/js.jar'

# Start postgres
alias start_pg='postgres -D /usr/local/var/postgres'

# Start Mongo
alias start_mongo='mongod run --config /usr/local/Cellar/mongodb/1.4.3-x86_64/mongod.conf'

# Start Redis
alias start_redis='redis-server /usr/local/etc/redis.conf'

# ------------------------------------------------------------------------
# PATHS
# ------------------------------------------------------------------------

export WORKON_HOME="/Users/Jarod/.virtualenvs/"
export PATH=$PATH:$HOME/clojure/leiningen/

# Flex
export PATH=$PATH:/Developer/SDKs/flex_sdk_4.1.0/bin/

# FUTURE NOTICE:
# Had to edit this script to stop an egrep warning
source /usr/local/bin/virtualenvwrapper.sh

# Add Disqus Django build to python path
export PYTHONPATH=${PYTHONPATH}:/Users/Jarod/Sites/disqus/trunk/django_root/

# Add Clojure contrib
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.1.0/clojure-contrib.jar

# ------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------
#

D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'


export PS1="
${PINK}%n ${GREEN}%~
${PINK}>${D} "
