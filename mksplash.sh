#!/bin/bash

function run_convert()
{
	BGSIZE=$1
	BGCOLOR=$2
	ICONSIZE=$3
	ICONFILE=$4
	OUTPUT=$5
	echo -e "converting $5"
	convert -size $BGSIZE xc:$BGCOLOR /tmp/$$-bg.png
	convert $ICONFILE -resize $ICONSIZE /tmp/$$-icon.png
	convert -composite -gravity center /tmp/$$-bg.png /tmp/$$-icon.png $OUTPUT
}

WIDTH=(320 768 1024 320)
HEIGHT=(480 1024 768 568)
ICON=(100 256 256 100)
NAME=("" -Portrait -Landscape -568h)
TAIL=(~iphone ~ipad ~ipad ~iphone)

for POS in {0..3}
do
	W=${WIDTH[$POS]}
	H=${HEIGHT[$POS]}
	I=${ICON[$POS]}
	N=${NAME[$POS]}
	T=${TAIL[$POS]}

	if [ "${N}" != "-568h" ]
	then
	run_convert ${W}x${H} black ${I}x${I} $1 Default${N}${T}.png
	fi
	run_convert $((W*2))x$((H*2)) black $((I*2))x$((I*2)) $1 Default${N}@2x${T}.png
	
done

#run_convert 320x480 black 100x100 original_icon.jpg Default~iphone.png
#run_convert 640x960 black 200x200 original_icon.jpg Default@2x~iphone.png
#run_convert 320x480 black 100x100 original_icon.jpg Default~iphone.png
