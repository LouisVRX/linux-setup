#! /bin/bash

docker exec -it -e LINES=`tput lines` -e COLUMNS=`tput cols` `docker ps | fzf | awk '{print $1}'` bash
