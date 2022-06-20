status_code () {
		local white red blue green shape exclamation check
		white='#FFFFFB'
		red='#F75C2F'
		blue='#81C7D4'
		green='#5DAC81'
		shape='%{\uE0B0%2G%}'
		check='%{\uF00C%2G%}'
		exclamation='%{\uF06A%2G%}'

		local face="%{%F{${green}}%} (｡╹ω╹｡)何する〜? %# %{%f%}"
		local success="%{%K{${white}}%F{${blue}}%} ${check} %{%k%F{${white}}%}${shape}%{%f%}"
		local error="%{%K{${red}}%F{${white}}%} ${exclamation} %B%?%b %{%k%F{${red}}%}${shape}%{%f%}"
		
		local result="%(?.${success}.${error})"

		echo "${result}${face}"
}
