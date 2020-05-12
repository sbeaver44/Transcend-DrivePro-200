#!/bin/bash
m=0
cdir="$(pwd)"
echo "${cdir}"
tripname="Trip Name Goes Here"
rm filelist.txt
touch filelist.txt
for d in */*.MOV
		do
		((m++))
		echo "${d} is ${m}"
		mno=$(printf '%04d' "${m}")
		fn="${cdir}/TS_${mno}.MOV"
		echo "file '${fn}'"|tee -a filelist.txt
		cp "${d}" "${fn}"
	done
ffmpeg -f concat -safe 0 -i filelist.txt -c copy "${tripname}.MOV"
ffmpeg -r:v "479.52/1" -i "${tripname}.MOV" -an -r:v "59.94/1" -c:v libx264 "${tripname}_lapse16.mp4"
mv "${tripname}.MOV" "${tripname}_full.mp4"
rm *.MOV
rm filelist.txt
