#!/bin/bash
#Most work done by Gilles 'SO - stop being evil' on stack overflow 
#https://unix.stackexchange.com/questions/10241/how-can-i-make-iconv-replace-the-input-file-with-the-converted-output

localisationPath=After\ the\ End\ Fan\ Fork/localisation/

for thisfile in "$localisationPath"*.csv
do
	iconv --verbose -f $(file -b --mime-encoding "$thisfile") -t ISO-8859-1//TRANSLIT "$thisfile" > "$thisfile.new" &&
	mv -f "$thisfile.new" "$thisfile"
done;

#Get rid of loose files
rm -f "$localisationPath"*.new

unset localisationPath
