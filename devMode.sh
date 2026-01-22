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
verifyAppRunning(){
  local app=$1
  if ! ps aux | grep -v grep | grep -q "$app"; then
    $app > /dev/null 2>&1 &
  fi
}

start_web_enviroment() {
   verifyAppRunning "code"
   verifyAppRunning "firefox"
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

