# status_code () {
# 		local ok="(｡╹ω╹｡)何する〜? < "
# 		local ng="(ｏдｏlll%)できんかった < "
# 
# 		local color face reset
# 		
# 		color="%{%(?.${fg[green]}.${fg[blue]})%}"
# 		face="%(?!${ok}!${ng})"
# 		reset="%{${reset_color}%}"
# 
# 		echo "${color}${face}${reset}"
# }


upper_left () {
		local letter name_c path_c shape_cn shape_cp name path shape folder man

		letter="%{%F{236}%}"
		name_c="%{%K{178}%}"
		path_c="%{%K{070}%}"
		shape_cn="%{%F{178}%}"
		shape_cp="%{%F{070}%}"
		name=" %n "
		path=" %d "
		shape='\uE0B0'
		folder=' \U1F4C2'
		man=' \U1F464'

 		echo "${letter}${name_c}${man}${name}${path_c}${shape_cn}${shape}${letter}${folder}${path}%{%k%}${shape_cp}${shape}%{%f%}"
}
