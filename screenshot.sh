#!/bin/sh

dmenucmd="dmenu -i"
xclipcmd="xclip -selection clipboard -t image/png -i"
xdocmd="xdotool getactivewindow"

savedirectory="/home/latef/Pictures/Screenshots"
dateformat="date +%s"

type1="selection" type2="full" type3="window"
clip1="yes"       clip2="no"   clip3="back"

getclip(){ clipchoice=$(echo -e  "$clip1\n$clip2\n$clip3" | $dmenucmd -i -p "Copy to clipboard?"); }
removefiller() {
       filename="$savedirectory/$(ls $savedirectory | tail -n 1)"
       filetype=$(file $filename | cut -d\  -f2)
       if [ "$filetype" = "empty" ]; then
               rm $filename
       fi
}

loop=1
while [ "$loop" -eq 1 ]
do
loop=0

typechoice=$(echo -e "$type1\n$type2\n$type3" | $dmenucmd -i  -p "Screenshot")
case "$typechoice" in
        "")
                exit ;;
        "$type1")
                getclip
                case "$clipchoice" in
                        "")
                                exit ;;
                        "$clip1")
                                maim -s -u | tee $savedirectory/Screenshot-$($dateformat).png | $xclipcmd 
                                removefiller ;;
                        "$clip2")
                                maim -s -u $savedirectory/Screenshot-$($dateformat).png ;;
                        "$clip3")
                                loop=1 ;;
                esac ;;
        "$type2")
                getclip
                case "$clipchoice" in
                        "")
                                exit ;;
                        "$clip1")
                                maim -u | tee $savedirectory/Screenshot-$($dateformat).png | $xclipcmd 
                                removefiller ;;
                        "$clip2")
                                maim -u $savedirectory/Screenshot-$($dateformat).png ;;
                        "$clip3")
                                loop=1 ;;
                esac ;;
        "$type3")
                getclip
                case "$clipchoice" in
                        "")
                                exit ;;
                        "$clip1")
                                maim -i $($xdocmd) -u | tee $savedirectory/Screenshot-$($dateformat).png | $xclipcmd 
                                removefiller ;;
                        "$clip2")
                                maim -i $($xdocmd) -u $savedirectory/Screenshot-$($dateformat).png ;;
                        "$clip3")
                                loop=1 ;;
                esac ;;
esac

done

