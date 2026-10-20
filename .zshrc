# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change the frequency the auto-updater is run (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to set how old an update must be before it's applied, manually or via the auto-updater (in days).
# zstyle ':omz:update' cooldown 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git starship zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nhuang/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ulimit -s 2097152

guarantee() {
  if [ ! -d $1 ]; then
    mkdir $1
  fi
}

trans() {
  cwd=$(pwd)
  cd ~/Competitive-Programming-Files/
  ./AutoIns/autoins $cwd/$1.cpp submit/main.cpp
  cd $cwd
}

co() {
  guarantee out || return

  local main="$1"
  shift

  g++ \
    -g \
    -std=c++23 \
    -fsanitize=undefined \
    -fsanitize=address \
    -DLOCAL \
    -D_GLIBCXX_DEBUG \
    -D_GLIBCXX_DEBUG_BACKTRACE \
    -Wall \
    -Wextra \
    -Wshadow \
    -Wconversion \
    -Wfloat-equal \
    -Wshift-overflow \
    -Wformat=2 \
    -Wno-cpp \
    -pedantic \
    -fstack-protector \
    -fno-omit-frame-pointer \
    -I/home/nhuang/Competitive-Programming-Files/include/ \
    -I/home/nhuang/Competitive-Programming-Files/ \
    -I/home/nhuang/Competitive-Programming-Files/include/ac-library/ \
    -I/home/nhuang/Competitive-Programming-Files/include/testlib/ \
    -include /home/nhuang/Competitive-Programming-Files/include/pch/debug.hpp \
    -Winvalid-pch \
    -o \
    out/$main \
    $main.cpp \
    "$@" \
    -lstdc++exp \
}

fast() {
  guarantee out || return

  local main="$1"
  shift

  g++ \
    -O2 \
    -std=c++23 \
    -DLOCAL \
    -Wall \
    -Wextra \
    -Wshadow \
    -Wconversion \
    -Wfloat-equal \
    -Wshift-overflow \
    -Wformat=2 \
    -Wno-cpp \
    -pedantic \
    -I/home/nhuang/Competitive-Programming-Files/include/ \
    -I/home/nhuang/Competitive-Programming-Files/ \
    -I/home/nhuang/Competitive-Programming-Files/ac-library/ \
    -I/home/nhuang/Competitive-Programming-Files/testlib/ \
    -o \
    out/$main \
    $main.cpp \
    "$@" \
}

corun() {
  co "$@" && ./out/$1
}

frun() {
  fast "$@" && ./out/$1
}

coruni() {
  co "$@" && ./out/$1 < int
}

runtc() {
  for ((i = $3; i <= $4; i++)); do
    echo "test case" $i
    echo "-----"
    ./out/$1/$2 < $1/0$i.in > oup
    echo "-----"
    echo "Expected Output:"
    cat $1/0$i.out
    echo "-----"
    echo "Received Output:"
    cat oup
    echo "-----"
    echo "Difference:"
    diff -w oup $1/0$i.out
    echo "--------"
  done
}
oruntc() {
  for ((i = $2; i <= $3; i++)); do
    echo "test case" $i
    echo "-----"
    ./out/$1 < 0$i.in > oup
    echo "-----"
    echo "Expected Output:"
    cat 0$i.out
    echo "-----"
    echo "Received Output:"
    cat oup
    echo "-----"
    echo "Difference:"
    diff -w oup 0$i.out
    echo "--------"
  done
}

run() {
  guarantee out || return
  guarantee out/$1 || return
  co $1/$2
  runtc $1 $2 $3 $4
}
orun() {
  guarantee out || return
  co $1
  oruntc $1 $2 $3
}

runf() {
  guarantee out || return
  guarantee out/$1 || return
  fast $1/$2
  runtc $1 $2 $3 $4
}
orunf() {
  guarantee out || return
  fast $1
  oruntc $1 $2 $3
}

rrun() {
  cargo build
  for ((i = $3; i <= $4; i++)); do
    echo "test case" $i
    echo "-----"
    cargo run --bin $2 < $1/0$i.in > oup
    echo "-----"
    echo "Expected Output:"
    cat $1/0$i.out
    echo "-----"
    echo "Received Output:"
    cat oup
    echo "-----"
    echo "Difference:"
    diff -w oup $1/0$i.out
    echo "--------"
  done
}

rustinit() {
  cargo init --name $1
  cargo add --path ~/Competitive-Programming-Files/algo_lib/
  mkdir src/bin
}

rnp() {
  mkdir $1
  touch src/bin/$1.rs
}

transr() {
  cwd=$(pwd)
  source-builder src/bin/$1.rs --library algo_lib --path ~/Competitive-Programming-Files/algo_lib/ --output ~/Competitive-Programming-Files/submit/src/main.rs
  cd ~/Competitive-Programming-Files/submit/
  cargo build
  cd $cwd
}

cr-link() {
  ifuse --documents org.videolan.vlc-ios ~/iphone-files
}
