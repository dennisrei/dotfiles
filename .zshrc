zstyle ':zim:git' aliases-prefix 'g'
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# Add wisely, as too many plugins slow down shell startup.
# plugins=(
# 	git 
# 	zsh-autosuggestions 
# 	sudo
# 	zsh-256color)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

### alias
# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# alias for pushing commits and opening pull requests for azure devops
# alias gitpr='az repos pr create --delete-source-branch true --repository $(basename `g rev-parse --show-toplevel`) --source-branch $(git branch --show-current) --reviewers "email" "email" --title "$(git show --pretty=format:"%B" --no-patch)" --description "$(git show --pretty=format:"%B" --no-patch)"'

# Pip requires virtualenv
export PIP_REQUIRE_VIRTUALENV=true

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
