# 2020-1-18 ** テキスト処理コマンド導入のため記載
# 参考サイト "Qiita テキスト処理のための標準的なコマンド群の macOS への導入手順"

# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
[ -r /etc/zshrc ] && . /etc/zshrc

# 2020-1-18 ** 記載文終了



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

# ===== 環境変数 =====
# --- XDG ---
#export XDG_CONFIG_HOME=~/.config


# ━━━━━━━━━     ＊＊＊ 自己記載 ＊＊＊     ━━━━━━━━━


# 指定したディレクトリが使用可能ならそのディレクトリにあるファイルを実行していく
if [ -d $ZSH_CONFIG_DIR -a -r $ZSH_CONFIG_DIR -a -x $ZSH_CONFIG_DIR ]; then
		for i in $ZSH_CONFIG_DIR/*;
		do
				[[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
		done
fi



# - - - 環境変数 - - -
export PGDATA=/usr/local/var/postgres
export FZF_CTRL_T_COMMAND="rg --files --hidden --follow --glob '!.git/*'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=full --line-range :100 {}'"
#export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=header,grid --line-range :100 {}'"

# ━━━━━━━━━     === 補完機能関係 ===     ━━━━━━━━━
                                                 
                                                 
                                                 
# 補完機能を有効にする
autoload -Uz compinit; compinit
# 補完リストの選択候補ををハイライト
zstyle 'completion:*' menu select
# 入力ミス時に似たコマンドを表示
setopt correct

                                                 
                                                 
# ━━━━━━━━━   === 補完機能関係終了 ===   ━━━━━━━━━


# ━━━━━━━━━     === プロンプト関係 ===     ━━━━━━━━━



# バージョン管理システムの情報表示機能を使う
autoload -Uz vcs_info
# プロンプトを表示するときに最初に変数展開をしてくれるオプション
setopt prompt_subst
# プロンプト表示前に実行される関数
precmd () { vcs_info }


PROMPT='
`upper_left`
`status_code`'

PROMPT2='[%n]> '

SPROMPT='`suggest`'



# vcs_infoの設定のカスタマイズ
# 有効にする(指定してgitのみにしてる)
zstyle ':vcs_info:*' enable git
# formatsの%uと%cを使えるようにする
zstyle ':vcs_info:git:*' check-for-changes true
# ステージされているがコミットされていないファイルがあるときの設定
zstyle ':vcs_info:git:*' stagedstr "%{%F{226}%}+%{%f%}"
# ステージされていないファイルがあるときの設定
zstyle ':vcs_info:git:*' unstagedstr "%{%F{196}%}!%{%f%}"
# vcs_info_msg_0_で表示する内容の設定
zstyle ':vcs_info:*' formats "%{%F{046}%} %b %{%f%}%c%u" 
# rebase途中やmergeでコンフリクトが発生したり等の特別な状況で表示される
zstyle ':vcs_info:*' actionsformats "%{%K{196}%F{227}%} %b | ! %a %{%f%k%}%c%u"

RPROMPT='${vcs_info_msg_0_}'



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



# Homebrew と anyenv の干渉回避( brew 時だけ anaconda のパスを取り除く)
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
# 次作コマンドなど。必要に応じてコメントアウト
# iTerm2の透過度変更スクリプト
#alias tp=transparency.sh
# Google Chrome を開く
#alias chrome="open -a 'Google Chrome'"

# manコマンドの日英語両用設定  参考：https://zenn.dev/kumamoto/articles/d536ac6df8a544
alias man='env LANG=C man'
alias jman='env LANG=ja_JP.UTF-8 man'

alias nv='nvim'


#                                                      
#                                                      
#                                                      
# ━━━━━━━━━   === alias関係終了 ===   ━━━━━━━━━


# ━━━━━━━━━     === 表示関係 ===     ━━━━━━━━━


# プロンプトを表示する直前にキャリッジリターンを出力
setopt prompt_cr
# prompt_cr オプションによって表示されなかった行を保持する
setopt prompt_sp



# ━━━━━━━━━   === 表示関係終了 ===   ━━━━━━━━━



# *** 関数 ***



mkcd() {
		mkdir $1 && cd $1 && pwd
}



# *** 関数終了 ***

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
