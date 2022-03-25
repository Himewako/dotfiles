source $VIMRUNTIME/defaults.vim
set encoding=utf8
set helplang=ja,en

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}



"  = = = 変数、関数定義 = = = 
" --- スニペット定義ファイルのパス ---
let g:vsnip_snippet_dir = "~/.vim/.vsnip"

" --- SyntaxInfo コマンド ---
"  カーソル位置のハイライトグループを表示
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" --- シェルのエイリアス使用 ---
let $ZSH_ENV = "~/.zsh_aliases"



"  = = = 画面・表示 = = = 

" --- truecolor ---
set termguicolors
" ---コードの色分け ---
syntax enable
" --- カラースキーム ---
colorscheme forest
" ---曖昧幅の文字を全角幅で表示 ---
set ambiwidth=double
" ---背景やハイライトの色設定 ---
"highlight Normal ctermbg=black ctermfg=007
"highlight StstusLine term=none cterm=none ctermfg=none ctermbg=gray
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
" ---ステータスラインを常時表示 ---
set laststatus=2
" ---ステータスラインの表示内容 ---
set statusline=%F%r%h%=
" --- 行番号 ---
set number
" ---編集中のファイル名を表示 ---
set title
" ---括弧入力時に対応する括弧を強調 ---
set showmatch
" ---検索文字列のハイライト無効 ---
set nohlsearch
" ---カーソルのある行のハイライト有効 ---
set cursorline



"  = = = 編集設定 = = = 

" ---括弧補完 ---
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
"inoremap \" \""<LEFT>
"inoremap ' ''<LEFT>
" ---インデントをスペース4つ分に設定 ---
set tabstop=4
" ---オートインデント ---
set smartindent
" ---ビープx 画面点滅o ---
"set visualbell
" ---ビープx 画面点滅x ---
set vb t_vb=
" ---undoの履歴を保存し永続化 ---
if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif



"  = = = 検索設定 = = = 

" ---大文字/小文字の区別なく検索する ---
set ignorecase
" ---検索文字列に大文字が含まれている場合は区別して検索する ---
set smartcase
" ---検索時に最後まで行ったら最初に戻る ---
set wrapscan
" ---インクリメンタル検索(文字を入力の都度検索してくれる) ---
set incsearch



"  = = = 入力設定 = = = 

" ---コマンドラインモード入力補完 ---
set wildmenu wildmode=list:full



"  = = = コピー＆ペースト = = = 

" --- クリップボード使用 ---
set clipboard=unnamed,autoselect



"  = = = マッピング = = = 

" --- jjでインサート->ノーマル ---
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>



"  = = = ファイル読み込み = = = 

" --- シンタックス ---
"au BufRead,BufNewFile *.py set filetype=python
