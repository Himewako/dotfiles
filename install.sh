#!/bin/bash

set -exuo pipefail

: "getDirectoryPath" && {
		#　本ファイル が存在するカレントディレクトリの絶対パスをカレントディレクトリを移動せずに取得
		cwd=`dirname "${0}"`
		DOTFILES_PATH=`(cd "${cwd}" && pwd)`
}

: "mkSymboliclink" && {

		#　正規表現で設定ファイルを取得し、シンボリックリンクを貼る
		for f in .??*
		do
				#　除外リスト
				[[ "$f" == ".git" ]] && continue
				[[ "$f" == ".gitignore" ]] && continue
				[[ "$f" == ".DS_Store" ]] && continue

				#　シンボリックリンクを貼る
				ln -snfv ${DOTFILES_PATH}/"${f}" ~/"${f}"
		done
}
