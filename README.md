# tquin/ansible_role_minecraft_fabric_server

An Ansible role to install a Fabric Minecraft server, complete with a customisable mods list and systemd timers for regular backups.

# Supported

- ✔ Ubuntu Jammy 22.04
- ✔ Debian Bookworm 12
- ✔ Fedora 38

# Dependencies

- `community.general`
  - Used for various functionality such as json_query, filetree, and docker_container.
- `geerlingguy.docker`
  - Used to install docker to run mcrcon container.

# Usage

| Variable | Description | Default |
| --- | --- | --- |
| minecraft_user | Linux username that owns and runs the service. Will be created if it doesn't already exist. | `minecraft` |
| minecraft_dir | Directory to install the server in. | `/srv/minecraft` |
| minecraft_version | Minecraft version to install. Updates are easily supported by symlinking the latest executable. | `1.20.1` |
| minecraft_fabric_version | Minecraft Fabric version to install. This shouldn't need to change. | `0.14.22/0.11.2` |
| minecraft_world_name | Name of the save file. | `my_minecraft_world` |
| minecraft_seed | Seed to use for world generation. The default is [a lovely secluded lake.](https://www.chunkbase.com/apps/seed-map#8624896) | `8624896` |
| minecraft_motd | Message of the day. Text to display on the multiplayer server list. | `A Minecraft Server` |
| minecraft_difficulty | Should be one of: `peaceful`, `easy`, `normal` or `hard`. | `hard` |
| minecraft_ram_mb | RAM amount to allocate to the server, in MiB. | `1024` (1GiB) |
| minecraft_backup_time | Time of day to invoke backup script, in local timezone. | `3:00:00` (3AM) |
| minecraft_mods | List of mods from Modrinth to install. The defaults here are vanilla with performance optimisations. You can find the slug value from the mod page url, eg: `modrinth.com/mods/<slug>` | - `fabric-api`<br/>- `sodium`<br/>- `lithium`<br/>- `fabric-language-kotlin`<br/>- `indium` |
| minecraft_ops | List of players with op/mod/admin permissions. | - `Etho` |
| minecraft_use_allowlist | Control the server setting to use the allowlist file or not. | `true` |
| minecraft_allowlist | Allowlist/Whitelist of players allowed to join the server. | - `Etho` |
| minecraft_backup_dir | Where to store backup files. | `/srv/minecraft/backups` |
| minecraft_backup_retention_mins | How long to keep old backups for before purging them, in **minutes.** The default value is 7 days. | `10080` |
| minecraft_time_zone | Timezone used for backup file naming. | `Australia/Victoria` |
| mcrcon_pass | Password for mcrcon, which is used for starting, stopping, and backing up the server. You should store this in an Ansible Vault and pass it into the role. | None |
