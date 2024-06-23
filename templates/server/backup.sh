#!/bin/bash

level_name=$(<.world.name)
mcrcon_pass=$(<.mcrcon.pass)
minecraft_dir="{{ minecraft_dir }}"
minecraft_backup_dir="{{ minecraft_backup_dir }}"

function rcon {
  $minecraft_dir/mcrcon -H 127.0.0.1 -P 25575 -p "$mcrcon_pass" "$1"
}

rcon "save-off"

rcon "save-all"

tar -cvpzf "$minecraft_backup_dir/$level_name/backup-$(date +%F-%H-%M).tar.gz" "$minecraft_dir/$level_name/"

rcon "save-on"

## Delete older backups
if [ "{{ minecraft_backup_removal_enabled }}" = "true" ]; then
  find "$minecraft_backup_dir/$level_name" -type f -mtime +{{ minecraft_backup_retention_days }} -name '*.gz' -delete
fi
