alias exa="eza"

if [ `machine` != arm64e ]; then
    echo 'Execing arm64 shell'
    exec arch -arm64 zsh
fi



source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.aliasrc

export LANG=en_US.UTF-8
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$HOME/bin:$PATH
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=auto
export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/:$LD_LIBRARY_PATH"
export EZA_CONFIG_DIR="$HOME/.config/eza-themes/"

autoload -U colors && colors

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_COMPLETION_TRIGGER='~~'

PROMPT='
$(gitprompt)
%{$fg[cyan]%}%~%{$reset_color%}
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
source $HOME/.zsh/git-prompt.zsh/git-prompt.zsh

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# VIM settings
bindkey -v
bindkey -M vicmd h vi-backward-char
bindkey -M vicmd k vi-down-line-or-history
bindkey -M vicmd j vi-up-line-or-history
bindkey -M vicmd l vi-forward-char

# Change cursor sape for different vi modes.
 function zle-keymap-select {
     if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
             echo -ne '\e[1 q'
         elif [[ ${KEYMAP} == main ]] ||
             [[ ${KEYMAP} == viins ]] ||
             [[ ${KEYMAP} = '' ]] ||
             [[ $1 = 'block' ]]; then
                     echo -ne '\e[6 q'
     fi
 }
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}




if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi


eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rjn/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rjn/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/rjn/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rjn/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

