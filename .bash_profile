alias rm='rm -iv'
alias mv='mv -i'
alias ls='ls -pABFG'
alias diff='diff -u'

alias b='bundle'
alias be='bundle exec'

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

export EDITOR=emacs
export HISTSIZE=10000
export PATH=/usr/local/bin:$PATH

# libgerbv
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig/$PKG_CONFIG_PATH
export PATH=${PATH}:/usr/local/opt/gettext/bin

# Javacの日本語出力をUTF8にする
alias javac='javac -J-Dfile.encoding=UTF-8'

# JavaのC/C++対応
export PATH=$PATH:~/Documents/EclipseADT/ndk

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Python
alias ipython='ipython --pprint --no-confirm-exit'
export PYTHONPATH=/usr/local/var/pyenv/shims/python

# Pyenv
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# プロンプトにpyenvのversionを表示するための関数
__pyenv_ps1 ()
{
    pyenv_local_version=`pyenv local 2>&1`
    pyenv_python_version=`pyenv version | sed -e 's/ .*//'`
    if [ ! "`echo $pyenv_local_version | grep "no local version configured"`" ]; then
	printf " (python $pyenv_python_version)"
    else
	echo ""
    fi
}

# Ruby
# Rbenv
eval "$(rbenv init -)"
# prompt with ruby version
__rbenv_ps1 ()
{
  rbenv_local_version=`rbenv local 2>&1`
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  if [ ! "`echo $rbenv_local_version | grep "no local version configured"`" ]; then
      printf " (ruby $rbenv_ruby_version)"
  else
      echo ""
  fi
}

# bash補完
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# プロンプトにgitのブランチ名・rbenvのversion・pyenvのversionを表示
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
    source `brew --prefix`/etc/bash_completion.d/git-completion.bash

    PS1='\[\e[32m\]\W'
    branch_name='\[\e[38;5;214m\]$(__git_ps1 " (%s)")'
    ruby_version='\[\e[0;31m\]$(__rbenv_ps1)'
    python_version='\[\e[0;31m\]$(__pyenv_ps1)'
    suffix="\[\033[00m\]: "

    if [ -r "`brew --prefix`/etc/bash_completion.d/git-completion.bash" ]; then
	PS1=${PS1}${branch_name}
    fi

    if [ -f `which rbenv` ]; then
	PS1=${PS1}${ruby_version}
    fi

    if [ -f `which pyenv` ]; then
	PS1=${PS1}${python_version}
    fi

    PS1=${PS1}${suffix}
fi

# Node
PATH="./node_modules/.bin:$PATH"

source ~/.profile

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
