#!/bin/bash
echo -e "Username"
read username 
test -d /home/$username && echo "Home directory existe" || echo "home directory do not existe"
