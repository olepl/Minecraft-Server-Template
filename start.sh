#!/usr/bin/env bash

if [ -n "$( cat ./config.json | jq -r '."startup message"' )" ] ; then
     cat ./config.json | jq -r '."startup message"' | figlet -c
fi

if [ ! $($( cat ./config.json | jq '."gui"' )) ] ; then
     gui="-nogui"
fi

java \
         $( cat ./config.json | jq -r '."java options"[]' ) \
    -jar $( cat ./config.json | jq -r '."server jar"'     ) \
    $gui
