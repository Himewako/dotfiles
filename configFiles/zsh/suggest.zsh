suggest () {
		local color yes no about edit message

		color="${fg[red]}"

		yes="${fg[green]}それだ(y)${reset_color}"
		no="${fg[red]}違ーう(n)${reset_color}"
		about="${fg[blue]}やっぱなし(a)${reset_color}"
		edit="${fg[cyan]}直す〜(e)${reset_color}"

		message="${color}( ╹✖╹)?${reset_color} < もしかして ${color}%B%r%b${reset_color} かい？ [${yes},${no},${about},${edit}]: "

		echo "${suggest}${message}"
}
