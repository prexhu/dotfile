# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/prexhu/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/prexhu/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/prexhu/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/prexhu/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<






### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting
    #starship/starship \

zinit snippet OMZL::git.zsh
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZP::git

setopt promptsubst
zinit snippet OMZT::robbyrussell
### End of Zinit's installer chunk

autoload -Uz compinit
compinit

alias rm=trash



#export https_proxy=http://127.0.0.1:15732 http_proxy=http://127.0.0.1:15732 all_proxy=socks5://127.0.0.1:15733

#eval "$(starship init zsh)"
#export STARSHIP_CONFIG=~/.config/starship/starship.toml


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/prexhu/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<


. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"


eval "$(fzf --zsh)"
