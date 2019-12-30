# Created by newuser for 5.7.1

export PATH=$PATH:$HOME/bin
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -U promptinit; promptinit

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...





# ━━━━━━━━━     ＊＊＊ 自己記載 ＊＊＊     ━━━━━━━━━


# 指定したディレクトリが使用可能ならそのディレクトリにあるファイルを実行していく
if [ -d $ZSH_CONFIG_DIR -a -r $ZSH_CONFIG_DIR -a -x $ZSH_CONFIG_DIR ]; then
		for i in $ZSH_CONFIG_DIR/*;
		do
				[[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
		done
fi




# ━━━━━━━━━     === 補完機能関係 ===     ━━━━━━━━━
#                                                 
#                                                 
#                                                 


# 補完機能を有効にする
autoload -Uz compinit; compinit
# 補完リストの選択候補ををハイライト
zstyle 'completion:*' menu select
# 入力ミス時に似たコマンドを表示
setopt correct

#                                                 
#                                                 
#                                                 
# ━━━━━━━━━   === 補完機能関係終了 ===   ━━━━━━━━━


# ━━━━━━━━━     === プロンプト関係 ===     ━━━━━━━━━
#                                                 
#                                                 
#                                                 


# バージョン管理システムの情報表示機能を使う
autoload -Uz vcs_info
# プロンプトを表示するときに最初に変数展開をしてくれるオプション
setopt prompt_subst
# プロンプト表示前に実行される関数
precmd () { vcs_info }

# vcs_infoの設定のカスタマイズ
# 有効にする(指定してgitのみにしてる)
zstyle ':vcs_info:*' enable git
# formatsの%uと%cを使えるようにする
zstyle ':vcs_info:git:*' check-for-changes true
# ステージされているがコミットされていないファイルがあるときの設定
zstyle ':vcs_info:git:*' stagedstr "%F{226}+%f"
# ステージされていないファイルがあるときの設定
zstyle ':vcs_info:git:*' unstagedstr "%F{196}!%f"
# vcs_info_msg_0_で表示する内容の設定
zstyle ':vcs_info:*' formats "%F{046} %b %f%c%u" 
# rebase途中やmergeでコンフリクトが発生したり等の特別な状況で表示される
zstyle ':vcs_info:*' actionsformats "%K{196}%F{227} %b | ! %a %f%k%c%u"

RPROMPT='${vcs_info_msg_0_}'

# RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# precmd () { vcs_info }
# RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


PROMPT="
`upper_left`
`status_code`"

PROMPT2='[%n]> '

SPROMPT='`suggest`'



#                                                 
#                                                 
#                                                 
# ━━━━━━━━━   === プロンプト関係終了 ===   ━━━━━━━━━


# ━━━━━━━━━     === history(履歴)関係 ===     ━━━━━━━━━
#                                                      
#                                                      
#                                                      


# 履歴の保存先ファイル
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# 重複コマンドは履歴に残さない
setopt HIST_IGNORE_DUPS
# ヒストリに追加されるコマンドが古いものと同じなら古い履歴を除去
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する前に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に残さない
setopt hist_no_store
# 補完時にヒストリを展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# インクリメンタルからの検索選択キー
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward


#                                                      
#                                                      
#                                                      
# ━━━━━━━━━   === history(履歴)関係終了 ===   ━━━━━━━━━


# ━━━━━━━━━     === alias関係 ===     ━━━━━━━━━
#                                                      
#                                                      
#                                                      


# 次作コマンドなど。必要に応じてコメントアウト
alias tp=it_transparency.sh


#                                                      
#                                                      
#                                                      
# ━━━━━━━━━   === alias(履歴)関係終了 ===   ━━━━━━━━━
