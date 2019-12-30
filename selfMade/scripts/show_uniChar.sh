#!/bin/zsh

start=`echo "ibase=16; $1" | bc`
last=`echo "ibase=16; $2" | bc`
count=$((last - start))

for ((i=0; i<(${count} + 1); i++))
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
