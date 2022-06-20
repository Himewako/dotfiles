suggest () {
		local color suggest reset yes no about edit message

		color='%{%F{#E83015}%}'
		suggest='%{%F{#DC9FB4}%}'
		reset='%{%f%}'

		yes="%{%F{#7BA23F}%}それだ(y)${reset}"
		no="%{%F{#268785}%}違ーう(n)${reset}"
		about="%{%F{#F75C2F}%}やっぱなし(a)${reset}"
		edit="%{%F{#F7C242}%}直す〜(e)${reset}"

		message="${color} ( ╹✖╹)?${reset} < もしかして ${suggest}%B%r%b${reset} かい？ [${yes}|${no}|${about}|${edit}]: "

		echo "${message}"
}
