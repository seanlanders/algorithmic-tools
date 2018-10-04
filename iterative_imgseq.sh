echo "What frame rate would you like the exported image sequence to be...?"
read framerate
echo $framerate

for dir in "./*/"
do
	echo $dir
	Pushd $dir
	for f in *.mp4
	do
		Pushd $dir
		echo $f
		dirname=${f%.mp4}
		echo "MAKING " $dirname
		mkdir $dirname
		echo "EXECUTING ffmpeg for " $f
		ffmpeg -i $f -framerate $framerate "./$dirname/$dirname-%05d.jpg"
		echo "NEXT"
	done
	Popd
done
echo "END"
