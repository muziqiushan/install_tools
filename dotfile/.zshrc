export LANG="en_US.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export LESSCHARSET="UTF-8"
# 以下配置来自知乎：https://www.zhihu.com/question/21418449
# Initialize command prompt
export PS1="%n@%m:%~%# "

# Enable 256 color to make auto-suggestions look nice
export TERM="xterm-256color"

# Load local bash/zsh compatible settings
_INIT_SH_NOFUN=1
[ -f "$HOME/.local/etc/init.sh" ] && source "$HOME/.local/etc/init.sh"

# exit for non-interactive shell
[[ $- != *i* ]] && return

# WSL (aka Bash for Windows) doesn't work well with BG_NICE
[ -d "/mnt/c" ] && [[ "$(uname -a)" == *Microsoft* ]] && unsetopt BG_NICE

# Initialize antigen
ANTIGEN_CACHE=false

if[ ! -f '~/bin/antigen.zsh' ];then
    curl -L git.io/antigen > ~/bin/antigen.zsh
    source ~/bin/antigen.zsh
fi
# Initialize oh-my-zsh
antigen apply
antigen use oh-my-zsh
antigen bundle pip
antigen bundle svn
antigen bundle git
antigen bundle github
antigen bundle docker
antigen bundle dotenv
antigen bundle node
antigen bundle php
antigen bundle python
antigen bundle laravel5
# antigen bundle vi-mode
antigen bundle colorize
# antigen bundle rupa/z z.sh
antigen bundle common-aliases
antigen bundle command-not-find
antigen bundle web-search
antigen bundle z
# ZSH_AUTOSUGGEST_USE_ASYNC=1
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
# antigen bundle supercrabtree/k
# antigen bundle Vifon/deer
antigen theme fishy

# check login shell
if [[ -o login ]]; then
	[ -f "$HOME/.local/etc/login.sh" ] && source "$HOME/.local/etc/login.sh"
	[ -f "$HOME/.local/etc/login.zsh" ] && source "$HOME/.local/etc/login.zsh"
fi

# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none
antigen bundle zsh-users/zsh-syntax-highlighting

# options
unsetopt correct_all
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.
# @self filetye alias
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'
alias -s php='vi'
alias -s blade='vi'
alias -s html='vi'
alias -s css='vi'
alias -s js='vi'
alias -s vue='vi'
alias -s blade='vi'
alias pc="proxychains4 "

#git
alias rm-swp='sudo find . -name "*.sw[a-z]"|xargs sudo rm '
alias svn-add="svn st|grep ? |awk '{print $2}'|xargs svn add "
alias git-add="git add -A "
alias git-ci="git commit -am "
alias git-co="git checkout "
alias git-push="git push origin master"
alias git-fetch="git fetch origin master"
alias git-pull="git pull"
alias git-del="git rm --cached "
alias git-reset="git reset --hard "
alias git-show="git show --stat "
alias git-status="git status "
alias git-stash="git stash "
alias git-diff="git diff @{upstream} "
alias git-rm="git rm --cached -r "
alias chmod-nginx="sudo chown -R nginx:nginx "

export EDITOR="nvim"
export VIM_USER="liyue"
#scp @demo
function scp-center() {
    # echo $1
    # return
    scp -r -P 62113 $1 liyue@10.1.12.10:/home/liyue
}
function scpf-center() {
    # echo $1
    # return
    scp -r -P 62113 liyue@10.1.12.10:$1 .
}
