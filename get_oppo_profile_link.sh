#!/bin/bash

debug_file="/path/to/debug.log"

tail -F $debug_file 2>&1 | while read -r line; do
    
    if [ "$start" = false ]; then
        grep -q "has appeared;  following new file"
        start=true
    elif [ -z $mode ]; then
        mode=$(echo "$line" | sed -n "s/.*Game mode is '\([0-9]\+\)'.*/\1/p")
    else
        oppo_id=$(echo "$line" | sed -n 's/.*, o:PlayerInfo(apolloId: \([0-9]\+\),.*/\1/p')
        if [ -n "$oppo_id" ]; then
            clear
            echo "https://gudecks.com/meta/player-stats?gameMode=$mode&userId=$oppo_id"
            echo "https://gumeta.web.app/ranked?userId=$oppo_id"
            start=false
        fi
    fi
done
