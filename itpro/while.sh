#!/bin/bash 
filenum=100
while  [ $filenum -gt 0 ]
do 
	touch video$filenum.mp4
filenum=$(($filenum - 1 ))
done
