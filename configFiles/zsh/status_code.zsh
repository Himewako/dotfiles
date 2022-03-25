status_code () {
		local ok="(｡╹ω╹｡)何する〜? < "
		local ng="(ｏдｏlll%)できんかった < "

		local color face reset
		
		color="%{%(?.${fg[green]}.${fg[blue]})%}"
		face="%(?!${ok}!${ng})"
		reset="%{${reset_color}%}"

		echo "${color}${face}${reset}"
}
