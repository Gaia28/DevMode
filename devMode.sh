#!/bin/bash

MESSAGE="
██╗      ███████╗███████╗████████╗███████╗      ██████╗ ██████╗ ██████╗ ███████╗
██║      ██╔════╝██╔════╝╚══██╔══╝██╔════╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║      █████╗  ███████╗   ██║   ███████╗     ██║     ██║   ██║██║  ██║█████╗  
██║      ██╔══╝  ╚════██║   ██║   ╚════██║     ██║     ██║   ██║██║  ██║██╔══╝  
███████╗ ███████╗███████║   ██║   ███████║     ╚██████╗╚██████╔╝██████╔╝███████╗
╚══════╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
"
FINISH_MESSAGE="
   _________
  |         |
  | dont    |
  | kill me |
  |_________|
      ||
      ||
"
start_web_enviroment() {
   code > /dev/null 2>&1 &
   firefox > /dev/null 2>&1 &
   sudo /opt/lampp/lampp start > /dev/null 2>&1 &
 
}

if [ "$1" == "-s" ]; then
   sudo /opt/lampp/lampp stop > /dev/null 2>&1
   pkill firefox
   pkill -9 code
   echo "$FINISH_MESSAGE"

else 
   start_web_enviroment
   echo "$MESSAGE"

fi                    

