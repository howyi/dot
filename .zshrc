# 日本語
export LESSCHARSET=UTF-8

fpath=(~/zsh-completions $fpath)

# 補完
autoload -U compinit
compinit

# 色
autoload colors
colors

# 256色設定
TERM='xterm-256color'

# lsの色設定
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 色付きls
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} menu select=2

# OSによってオプションを変更する
case "${OSTYPE}" in
darwin*)
	# Mac
	alias ls="ls -GF"
	;;
linux*)
	# Linux
	alias ls='ls -F --color'
	;;
esac

# プロンプト設定
PROMPT="%{${fg[magenta]}%}%n@%m%{${reset_color}%} %{${fg[red]}%}%~%{${reset_color}%}
%{${fg[blue]}%}%% %{${reset_color}%}"

# 現在ブランチを右プロンプトに表示
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}
RPROMPT=$'$(vcs_info_wrapper)'

if type direnv >/dev/null 2>&2; then
	eval "$(direnv hook zsh)"
fi

if [ -f ~/.linuxbrewrc ]; then
	. ~/.linuxbrewrc
fi

# tabで順に補完候補を切り替える
setopt auto_menu
# スペルチェック
setopt correct
# 補完候補を詰めて表示
setopt list_packed
# ディレクトリ名だけでcd
setopt auto_cd
# cd時に自動でpush
setopt auto_pushd

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# vでvimを起動
alias v=vim

export EDITOR=/usr/bin/vim

# git系
alias gcm='git commit'
alias gcmm='git commit -m'
alias gcma='git commit --amend'
alias gco='git checkout'
alias gb='git branch'
alias gbd='git branch -D'
alias gs='git status'
alias gp='git push'
alias gpf='git push -f'

alias u='phpunit'

echo 'こんにちは'
