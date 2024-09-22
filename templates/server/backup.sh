#!/usr/bin/env bash
set -eu

while [ $# -gt 0 ]; do
    case "$1" in
        --interval*|-i*)
        if [[ "$1" != *=* ]]; then shift; fi # Value is next arg if no `=`
        RSNAPSHOT_INTERVAL="${1#*=}"
        ;;
    esac
    shift
done


if [ -z ${RSNAPSHOT_INTERVAL:?x} ]; then 
    echo "err: missing arg: --interval"
    exit 1
fi

minecraft_dir="{{ minecraft_dir }}"
minecraft_backup_dir="{{ minecraft_backup_dir }}"
mcrcon_pass=$(<$minecraft_dir/.mcrcon.pass)

function rcon {
  $minecraft_dir/mcrcon -H 127.0.0.1 -P 25575 -p "$mcrcon_pass" "$1"
}

rcon "save-off"

rcon "save-all flush"

/usr/bin/rsnapshot \
    -c {{ minecraft_dir }}/rsnapshot.conf \
    $RSNAPSHOT_INTERVAL

rcon "save-on"
