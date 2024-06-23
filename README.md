# tquin/ansible_role_minecraft_fabric_server

An Ansible role to install a Fabric Minecraft server, complete with a customisable mods list and systemd timers for regular backups.

Tested on:
  * ✔ Ubuntu Jammy 22.04
  * ✔ Debian Bookworm 12
  * ✔ Fedora 38

# Usage

| Variable | Description | Default |
| --- | --- | --- |
| minecraft_user | Linux username that owns and runs the service. Will be created if it doesn't already exist. | `minecraft` |
| minecraft_dir | Directory to install the server in. | `/srv/minecraft` |
| minecraft_version | Minecraft version to install. Updates are easily supported by symlinking the latest executable. | `1.20.4` |
| minecraft_fabric_version | Minecraft Fabric version to install. This shouldn't need to change. | `0.15.6/1.0.0` |
| minecraft_world_name | Name of the save file. | `my_minecraft_world` |
| minecraft_seed | Seed to use for world generation. The default is [a lovely secluded lake.](https://www.chunkbase.com/apps/seed-map#8624896) | `8624896` |
| minecraft_motd | Message of the day. Text to display on the multiplayer server list. | `A Minecraft Server` |
| minecraft_difficulty | Should be one of: `peaceful`, `easy`, `normal` or `hard`. | `hard` |
| minecraft_ram_mb | RAM amount to allocate to the server, in MiB. | `1024` (1GiB) |
| minecraft_backup_time | Time of day to invoke backup script, in local timezone. | `3:00:00` (3AM) |
| minecraft_backup_dir | Where to save world backups. | `/srv/minecraft/backups` |
| minecraft_backup_removal_enabled | Whether to remove old backups or keep them forever. Must be one of: `true`, `false` | `true` |
| minecraft_backup_retention_days | How long to keep backup files before removing them. Must be an integer number of days. | `7` |
| minecraft_mods | List of mods from Modrinth to install. The defaults here are vanilla with performance optimisations. You can find the slug value from the mod page url, eg: `modrinth.com/mods/<slug>` | - `fabric-api`<br/>- `sodium`<br/>- `lithium`<br/>- `fabric-language-kotlin`<br/>- `indium` |
| minecraft_ops | List of players with op/mod/admin permissions. | - `Etho` |
| minecraft_ops_level | The [Permission level](https://minecraft.wiki/w/Permission_level) assigned to ops users. Controls what commands an op user can run. | `4` |
| minecraft_use_allowlist | Control the server setting to use the allowlist file or not. | `true` |
| minecraft_allowlist | Allowlist/Whitelist of players allowed to join the server. | - `Etho` |
| mcrcon_pass | Password for mcrcon, which is used for starting, stopping, and backing up the server. You should store this in an Ansible Vault and pass it into the role. | None |

# Todo

- containerise mcrcon
- containerise fabric server