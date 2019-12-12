ESC=$(printf '\033')
shape='\uE0B0'

echo "${ESC}[38;5;$3m${ESC}[48;5;$1m test ${ESC}[38;5;$1m${ESC}[48;5;$2m${shape}${ESC}[38;5;$3m test ${ESC}[0m${ESC}[38;5;$2m${shape}${ESC}[0m"
