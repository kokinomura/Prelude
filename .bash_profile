export PS1="\[\e[0;36m\]\W: \[\e[00m\]"

alias rm='rm -iv'
alias mv='mv -i'
alias ls='ls -pABFG'

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# gitのブランチ名を表示
if [ -f /usr/local/Cellar/git/2.0.0/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/Cellar/git/2.0.0/etc/bash_completion.d/git-prompt.sh
    source /usr/local/Cellar/git/2.0.0/etc/bash_completion.d/git-completion.bash
    if [ -r "/usr/local/Cellar/git/2.0.0/etc/bash_completion.d/git-completion.bash" ]; then
        PS1='\[\e[32m\]\W\[\e[38;5;214m\]$(__git_ps1 " (%s)")\[\033[00m\]: '
    else
        PS1="\[\e[32m\]\W: "
    fi
fi

source ~/.profile
