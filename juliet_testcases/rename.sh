find ./metadata -name "*a.sarif" | while read filename
do
	mv $filename ${filename:0:-7}.sarif
done
