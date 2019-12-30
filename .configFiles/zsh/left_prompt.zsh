upper_left () {
		local letter name_c path_c shape_cn shape_cp name path shape folder man

		letter="%F{236}"
		name_c="%K{178}"
		path_c="%K{070}"
		shape_cn="%F{178}"
		shape_cp="%F{070}"
		name=" %n "
		path=" %d "
		shape='\uE0B0'
		folder=' \U1F4C2'
		man=' \U1F464'

		echo "${letter}${name_c}${man}${name}${path_c}${shape_cn}${shape}${letter}${folder}${path}%k${shape_cp}${shape}%f"
}

status_code () {
		local color face
		
		color="%(?.${fg[green]}.${fg[blue]})"
		face="%(?!(｡╹ω╹｡)何する〜? < !(ｏдｏlll%)できんかった < )"

		echo "${color}${face}${reset_color}"
}

# upper_left () {
# 		local letter name_c path_c shape_cn shape_cp middle_fc middle_bc name path shape folder man
# 
# 		letter="%F{236}"
# 		name_c="%K{178}"
# 		path_c="%K{070}"
# 		shape_cn="%F{178}"
# 		shape_cp="%F{070}"
# 		middle_fc="%F{142}"
# 		middle_bc="%K{142}"
# 		name=" %n "
# 		path=" %d "
# 		shape='\uE0B0'
# 		folder=' \U1F4C2'
# 		man=' \U1F464'
# 
# 		echo "${letter}${name_c}${man}${name}${middle_bc}${shape_cn}${shape}${path_c}${middle_fc}${shape}${letter}${folder}${path}%k${shape_cp}${shape}%f"
# }
