#!/usr/bin/env bash
#
# Script name: dm-radio
# Description: Choose between online radio stations with dmenu.
# Dependencies: dmenu, mpv, dunst
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail



# script will not hit this if there is no config-file to load
# shellcheck disable=SC1090
#source "$(get_config)"

# The menu of radio station choices
menu() {
  printf "Quit\n"
  printf "1. Dance wave\n"
  printf "2. Radio discount\n"
  printf "3. Lofi radio\n"
  printf "6. house Music\n"
  printf "7. Mozart Classical radio\n"
  printf "8. Jazz Music\n"
  printf "9. amr diab\n"
  printf "10. Lofi Radio\n"
#  printf "11. HipHop49\n"
#  printf "12. Madhouse Country Radio\n"
#  printf "13. PopMusic\n"
#  printf "14. PopStars\n"
#  printf "15. RadioMetal\n"
#  printf "16. RocknRoll Radio"
}

# Functions for sending notification messages
start_radio() {
  notify-send  "Starting dm-radio" "Playing station: $1. 🎶"
}

end_radio() {
  notify-send  "Stopping dm-radio" "You have quit dm-radio. 🎶"
}

# Main function. Pipes the menu() function into DMENU.
choice=$(menu | rofi -dmenu  "Choose radio station:" | cut -d. -f1) || exit

# Case statement for making our station choice.
# We only need the number thanks to the cut command above.
case $choice in
  "Quit")
    end_radio ;
    pkill -f http
    exit
    ;;
  1)
    start_radio 'Dance wave' ;
     mpv "https://zeno.fm/radio/dance-wave/" &
    return
   ;;
  2)
    start_radio 'Radio Discount Tv' ;
    mpv "https://zeno.fm/radio/radiodiscount/" &
    return
   ;;
  3)
    start_radio 'Lofi radio' ;
    mpv "https://zeno.fm/radio/lofi-hip-hop-radio/" &
    return
   ;;
  4)
    start_radio 'Tamer Hosny' ;
    mpv "https://zeno.fm/radio/tamer-hosny/" &
    return
   ;;
  5)
    start_radio 'Tamer Ashour' ;
    mpv "https://zeno.fm/radio/tamerashour/" &
    return
   ;;
  6)
    start_radio 'House Music' ;
    mpv "https://zeno.fm/radio/radio-house-music/" &
    return
   ;;
  7)
    start_radio 'Classical Mozart radio' ; 
    mpv "https://zeno.fm/radio/mozart/" &
    return
   ;;
  8)
    start_radio 'Deep jazz Music' ;
    mpv "https://zeno.fm/radio/jazz-radio-bcn/" &
    return
   ;;
  9)
    start_radio 'Amr diab' ;
    mpv "https://zeno.fm/radio/AMRDIABFM/" &
    return
    ;;
  10)
    start_radio 'lofi Radio' ;
    mpv "https://zeno.fm/radio/lofi-hip-hop-radio/" &
    return
    ;;
#  11)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'HipHop49' ;
#    mpv "https://zeno.fm/radio/hiphop49/"
#    return
#    ;;
#  12)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'Madhouse Country Radio' ;
#    mpv "https://zeno.fm/radio/madhouse-country-radio/"
#    return
#    ;;
#  13)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'PopMusic ' ;
#    mpv "https://zeno.fm/radio/popmusic74vyurvmug0uv/"
#    return
#    ;;
#  14)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'PopStars' ;
#    mpv "https://zeno.fm/radio/popstars/"
#    return
#    ;;
#  15)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'RadioMetal' ;
#    mpv "https://zeno.fm/radio/radio-metal/"
#    return
#    ;;
#  16)
#    pkill -f http ||echo "mpv not running."
#    start_radio 'RocknRoll Radio' ;
#    mpv "https://zeno.fm/radio/rocknroll-radio994c7517qs8uv/"
#    return
#    ;;
  *)
    echo "Program terminated." && exit 0
    ;;
esac
