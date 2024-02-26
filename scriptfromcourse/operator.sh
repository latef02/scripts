
#Relational Operators examples
#Version:1.0
##Created Date: Thu May 10 22:43:16 IST 2018
##Modified Date:
##Author: Ankam Ravi Kumar
## START #
echo -e "Please provide one number: \c"
read -r h
echo -e "Please provide one number: \c"
read -r g I
test $h -lt $g; echo "$?";
test $h -le $g; echo "$?";
test $h -gt $g; echo "$?";
test $h -ge $g; echo "$?";
test $h -eq $g;echo "$?";
test $h -ne $g;echo "$?";
## END #
#~
