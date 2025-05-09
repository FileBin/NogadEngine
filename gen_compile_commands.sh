#!/usr/bin/env bash
ROOT="$PWD"

find ./prog -name jamfile | (
    while read -r JAM
    do
        echo "processing jam $JAM"
        cd "$ROOT"
        DIR="$(dirname "${JAM}")"
        cd "$DIR"
        JSON="$JSON$(
        jam -sDumpBuildCmds=yes -a -n | grep call.*cpp | sed 's/call//' | while read -r COMMAND
            do
                FILE=`echo "$COMMAND" | awk '{print $NF}'`
                COMMAND=`echo ${COMMAND//-mno-recip/}`
                COMMAND=`echo ${COMMAND//-fconserve-space/}`
                JSON_STRING=`jq -n --arg dir "$PWD" --arg cmd "$COMMAND" --arg file "$FILE" '{directory: $dir, command: $cmd, file: $file}'`
                echo "$JSON_STRING,"
            done)"
    done
    cd "$ROOT"
    JSON=`echo "$JSON" | sed '$ s/.$//'`
    JSON=`echo "[$JSON]" | jq`
    echo "$JSON" | tee compile_commands.json
)

