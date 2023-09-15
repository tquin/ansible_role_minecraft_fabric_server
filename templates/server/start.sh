#!/bin/bash

minecraft_dir="{{ minecraft_dir }}"

# 1GB
/usr/bin/java -Xms{{minecraft_ram_mb}}M -Xmx{{minecraft_ram_mb}}M -jar "$minecraft_dir/server.jar" nogui
