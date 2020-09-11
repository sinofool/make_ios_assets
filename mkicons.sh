#!/bin/bash

function run_convert()
{
	echo -e "converting $1\t$2\t$3"
	convert $1 -resize $2 $3
}

for TARGET in 57 60 72 76 29 40 50 167
do
	if [ ${TARGET} -eq 57 ]
	then
		NAME="";
	elif [ ${TARGET} -eq 29 ]
	then
		NAME="-small"
	else
		NAME="-${TARGET}"
	fi
	SIZE="${TARGET}x${TARGET}"
	SIZE2X="$((TARGET*2))x$((TARGET*2))"
	SIZE3X="$((TARGET*3))x$((TARGET*3))"

	run_convert $1 ${SIZE} icon${NAME}.png
	run_convert $1 ${SIZE2X} icon${NAME}@2x.png
	run_convert $1 ${SIZE3X} icon${NAME}@3x.png
done
