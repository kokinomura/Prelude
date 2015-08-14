alias rm='rm -iv'
alias mv='mv -i'
alias ls='ls -pABFG'

alias b='bundle'
alias be='bundle exec'

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

export EDITOR=emacs
export HISTSIZE=10000
export PATH=/usr/local/bin:$PATH

# boost
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/usr/local/include/:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=/usr/local/include/:$C_INCLUDE_PATH

# Javacの日本語出力をUTF8にする
alias javac='javac -J-Dfile.encoding=UTF-8'

# JavaのC/C++対応
export PATH=$PATH:~/Documents/EclipseADT/ndk

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Python
alias python='python3'
alias python2='/usr/bin/python'

# Ruby
# Rbenv
eval "$(rbenv init -)"
# prompt with ruby version
# rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  if [ $rbenv_ruby_version != "system" ]; then
      printf " (ruby $rbenv_ruby_version)"
  else
      echo ""
  fi
}

# bash補完
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# プロンプトにgitのブランチ名・rbenvのversionを表示
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
    source `brew --prefix`/etc/bash_completion.d/git-completion.bash

    # デフォルトはディレクトリ名
    PS1='\[\e[32m\]\W'

    branch_name='\[\e[38;5;214m\]$(__git_ps1 " (%s)")'
    ruby_version='\[\e[0;31m\]$(__rbenv_ps1)'
    suffix="\[\033[00m\]: "

    if [ -r "`brew --prefix`/etc/bash_completion.d/git-completion.bash" ]; then
	PS1=${PS1}${branch_name}
    fi

    if [ -f `which rbenv` ]; then
	PS1=${PS1}${ruby_version}
    fi

    PS1=${PS1}${suffix}
fi

source ~/.profile
