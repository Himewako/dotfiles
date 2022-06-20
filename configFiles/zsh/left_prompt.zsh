upper_left () {
		local brack white blue green yelow
		brack='#3A3226'
		white='#FFFFFB'
		blue='#81C7D4'
		green='#7BA23F'
		yelow='#E9CD4C'

		local shape apple man folder
		shape='%{\uE0B0%2G%}'
		apple='%{\uF302%2G%}'
		man='%{\uF007%2G%}'
		folder='%{\uF07C%2G%}'

		local mark directory username
		mark="%{%K{${blue}}%F{${white}}%} ${apple} %{%K{${yelow}}%F{${blue}}%}${shape}"
		username="%{%F{${brack}}%} ${man} %n %{%K{${green}}%F{${yelow}}%}${shape}"
		directory="%{%F{${brack}}%} ${folder} %d %{%k%F{${green}}${shape}%}"

		echo "${mark}${username}${directory}"
}
