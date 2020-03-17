#! /bin/sh

docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'
#mydockerps=$(docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}')
#echo $mydockerps
#echo "${mydockerps//'registry.realisations.net'/'real'}"
