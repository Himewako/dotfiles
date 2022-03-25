set background=dark
hi clear

let g:colors_name=expand('<sfile>:r:t')

" --- sistem ---
hi Normal guifg=#FAEBD7 guibg=#0C130C
hi Error cterm=bold guifg=#FF3F01
hi Cursor guibg=#a9efef
hi CursorLine cterm=none guibg=#102820
hi LineNr guifg=#42615C guibg=#182F18
hi CursorLineNr cterm=bold guifg=#C6DE41 guibg=#011A07

" --- syntax ---
hi Statement guifg=#8DDDB5
hi Constant guifg=#5999FF
hi Identifier cterm=NONE guifg=#58e055
hi PreProc guifg=#997AFF
hi Type guifg=#7dd182
hi Special cterm=bold guifg=#d2cf28
hi Comment guifg=#549661
hi vimOption guifg=#ad9913
hi vimSetEqual guifg=#faebd7
hi link vimGroup Statement
