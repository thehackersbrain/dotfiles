# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="duellj"
ZSH_THEME="thb-gkali"

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
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z aliases)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# custom paths
export ANDROID_HOME=$HOME/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$PATH:$HOME/.local/bin/:/home/elliot/.cargo/bin:$HOME/.npm-global/bin:/home/elliot/devs/flutter/bin:$ANDROID_HOME/platform-tools:$HOME/go/bin/
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$HOME/.local/bin:$PATH:$GEM_HOME/bin:$HOME/.config/emacs/bin"

#-----------------------------------------------------
getip() {
	if [[ $# == 1 ]]; then
		echo -e "IP: \e[1;32m$(ifconfig $1 | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1)"
	else
		echo -e "Usage: \e[32m$0\e[0m <network-interface>"
	fi
}
#-------------------------------------------------------
cpip() {
	if [[ $# == 1 ]]; then
		ifconfig $1 | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1 | tr -d '\n' | xclip -selection clip
	else
		echo -e "Usage: \e[32m$0\e[0m <network-interface>"
	fi
}
#-------------------------------------------------------

# Password copy in clipboard
pscp() {
	if [[ $# == 1 ]]; then
		passgen -l $1 | cut -d " " -f2 | tr -d '\n' | xclip -selection clip
	else
		echo -e "Usage: \e[32m$0\e[0m <passwd-length>"
	fi
}

#-------------------------------------------------------

# Connect to AWS EC2 Instance
hrserver() {
	if [[ $# == 1 ]]; then
		ssh -i /home/elliot/.ssh/hackandrecon-server.pem ubuntu@$1
	else
		echo -e "Usage: \e[32m$0\e[0m <ip-addr>"
	fi
}

#-------------------------------------------------------

L_IP_ADDR="$(ifconfig tun0 2>/dev/null | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1 | tr -d '\n')"
if [[ $L_IP_ADDR = "" ]]; then
	L_INT_IP_ADDR="$(ifconfig eno1 2>/dev/null | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1 | tr -d '\n')"
	if [[ $L_INT_IP_ADDR = "" ]]; then
		export IP="W $(ifconfig wlo1 2>/dev/null | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1 | tr -d '\n')"
	else
		export IP="E $L_INT_IP_ADDR"
	fi
else
	export IP="T $L_IP_ADDR"
fi
# export IP="M $(ifconfig wlo1 | grep -E -o -m 1 "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | head -1 | tr -d '\n')"

#-------------------------------------------------------

alias ls="exa"
alias ip="ip -c"
alias gpdf="bash /home/elliot/scripts/gpdf"
alias bbld="bash /home/elliot/efs/projects/books/intro-to-hacking/script/bbld"
alias blackhole="/home/elliot/efs/projects/BlackHole/build/linux/x64/release/bundle/blackhole"
alias clip='xclip -sel clip'
alias cloudshell="gcloud cloud-shell ssh --authorize-session"
alias toolsenv="source /home/elliot/tools/env/bin/activate"
alias mserverb="mitmweb -p 8082 --mode upstream:127.0.0.1:8080 --ssl-insecure"
alias mserverp="mitmweb -p 8082 --mode upstream:127.0.0.1:8085 --ssl-insecure"
alias gmssh='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/mrrobothacks-id_rsa'
alias gw='graphw00f'
alias npmpr='export npm_config_prefix="$HOME/.local"'
alias mphone='aft-mtp-mount /home/elliot/phone'
alias gcscp='gcloud cloud-shell scp'
#alias caido="/home/elliot/tools/caido/caido-desktop-v0.37.0-linux-x86_64.AppImage"
alias punisher='cd /home/elliot/efs/vagrant-machines/punisher && vagrant up && vagrant ssh'
alias punisherd='cd /home/elliot/efs/vagrant-machines/punisher && vagrant halt'
alias llvim='function _lvim() { terminator -e "lvim $@"; }; _lvim'
alias dtmux="tmux new-session -s LOCAL -n SHELL"
alias list='for i in `find -type f 2>/dev/null`; do echo -e "$i: \e[1;32m`cat $i | wc -l`\e[0m"; done'
alias rr='reconranger'
alias mehd="sudo mount -o uid=elliot,gid=elliot /dev/sdb1 /home/elliot/mnt"
alias cwee="cd /home/elliot/ehd/courses/HTB_CWEE && python -m http.server 55555"
alias burploader="cd /home/elliot/BurpSuitePro && java -jar burploader.jar"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/elliot/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/elliot/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/elliot/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/elliot/tools/google-cloud-sdk/completion.zsh.inc'; fi
source /usr/share/nvm/init-nvm.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1
