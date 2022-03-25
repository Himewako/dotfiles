"set background=light
highlight clear

let g:colors_name=expand('<sfile>:t:r')

if &background ==# 'light'

highlight Normal cterm=none guifg=#022c1b guibg=#FFE6AB
highlight Cursor cterm=none guibg=#A5DBFE
highlight LineNr cterm=none guifg=#603601 guibg=#A1B57D
highlight CursorLineNr cterm=bold guifg=#00FFFF guibg=#556B2F
highlight CursorLine cterm=none guibg=#E8FCCA
highlight Statement cterm=none guifg=#D29D2B
highlight Type cterm=none guifg=#3E8E7E
highlight Error cterm=none guifg=#FF280A
highlight vimOption cterm=none guifg=#f26907
highlight PreProc cterm=none guifg=#E18A4C
highlight Constant cterm=none guifg=#E1578A
highlight vimHiTerm cterm=none guifg=#007055

else
  " ... ここに明るい背景用の定義を書いていく

highlight Normal guifg=#FAEBD7 guibg=#30180D
highlight Cursor guibg=#40FFFF
highlight LineNr guifg=#D65F29 guibg=#1A3011
highlight CursorLineNr cterm=bold guifg=#00FFFF guibg=#556B2F
highlight CursorLine cterm=none guibg=#E8FCCA
highlight Statement cterm=none guifg=#D29D2B
highlight Type cterm=none guifg=#3E8E7E
highlight Error cterm=none guifg=#FF280A
highlight vimOption cterm=none guifg=#f26907
highlight PreProc cterm=none guifg=#E18A4C
highlight Constant cterm=none guifg=#E1578A
highlight vimHiTerm cterm=none guifg=#007055

endif
