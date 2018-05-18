# 日本語
export LESSCHARSET=UTF-8

fpath=(~/zsh-completions $fpath)

# 補完
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

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
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!🐔 <!🍗 <)%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='   < '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}🔥 < Did you mean %B%r%b %{$fg[red]%}? [y, n, a, e]:${reset_color} "

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

if [ -f ~/.linuxbrewrc ]; then
	. ~/.linuxbrewrc
fi

if type direnv >/dev/null 2>&2; then
	eval "$(direnv hook zsh)"
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

setopt prompt_subst

# History
HISTFILE=${HOME}/.zsh_history
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
HISTSIZE=1000
SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history

# vでvimを起動
alias v=vim

export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:./vendor/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

export EDITOR=/usr/bin/vim

# cd

export ANSICON=true

echo 'こんにちは'
