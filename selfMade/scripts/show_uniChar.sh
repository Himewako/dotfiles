#!/bin/zsh

startpre=`echo "$1" | tr '[:lower:]' '[:upper:]'`
lastpre=`echo "$2" | tr '[:lower:]' '[:upper:]'`
start=`echo "ibase=16; ${startpre}" | bc`
last=`echo "ibase=16; ${lastpre}" | bc`
count=$((last - start + 1))

for ((i=0; i<${count}; i++))
do
		code=$((i + start))
		show=`echo "obase=16; ${code}" | bc`
		echo -n "\u${show} "
#		echo -n "$((${start} + ${i})) "
		check=$(((i + 1) % 40))
		if [ $i -gt 0 -a $check -eq 0 ]; then
				echo
		fi
done
echo
echo

echo "start = ${start}"
echo "last = ${last}"
echo "count = ${count}"
