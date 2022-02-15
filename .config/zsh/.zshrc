#
alias vim="nvim"
autoload -U colors && colors
PROMPT="%F{46}%n%f%F{215}@%f:%F{46}%m%f%F{46}%~%f "

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
######### Complition ###########
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey "^R" history-incremental-search-backward

######## Cursor for VIM modes ######
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
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

autoload -Uz compinit
compinit
# End of lines added by compinstall
source $HOME/.config/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
