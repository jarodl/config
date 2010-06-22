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

alias v='mvim'
alias p='cd ~/Projects'
alias w='cd ~/Sites'
alias h='cd ~'

# Git specific
alias gitrm='git ls-files --deleted | xargs git rm'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gi='git init && touch README.md'
alias gc='git clone'
alias gp='git push'
alias gcom='git commit -m'
alias ga='git add'

# Django specific
alias dj='django-admin.py startproject'
alias dja='django-admin.py startapp'
alias djs='python manage.py runserver'
alias djsh='python manage.py shell'
alias djv='python manage.py validate'
alias djdb='python manage.py syncdb'

# Rails specific
alias sc='./script/console'
alias ss='./script/server'
alias sg='./script/generate'

# Disqus specific
alias disqus='cd ~/Users/Jarod/Sites && workon disqus'

# JavaScript
alias rhino='java -jar /usr/share/java/js.jar'

# ------------------------------------------------------------------------
# PATHS
# ------------------------------------------------------------------------

export WORKON_HOME="/Users/Jarod/.virtualenvs/"
source /usr/local/bin/virtualenvwrapper.sh
# Add Disqus Django build to python path
export PYTHONPATH=${PYTHONPATH}:/Users/Jarod/Sites/disqus/trunk/django_root/
