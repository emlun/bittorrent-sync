#!/bin/bash
# This file is part of btsync-autoconfig.
#
# btsync-autoconfig is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# btsync-autoconfig is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# btsync-autoconfig.  If not, see <http://www.gnu.org/licenses/>.
#
# =======================================
#
# Author: Emil Lundberg <lundberg.emil@gmail.com>
#
# Checks if the named config file exists, and creates it if necessary.
#
# This script will create a default BitTorrent Sync configuration file
# at $configPath, if it does not already exist. $configPath is the value
# of the first positional parameter if it exists, and
# ~/.config/btsync/btsync.conf if it does not exist.
#
# The script /usr/share/btsync-autoconfig/btsync-makeconfig.sh will be used to
# create the config file. No arguments will be given to the btsync-makeconfig.sh
# script.
#
# If creation of the config file fails, the script exits with nonzero
# exit status.
#
# Exit status codes:
#   0 The script was executed successfully.
#   1 The config file did not exist and the script failed to create its
#     parent directory
#   2 The config file did not exist, its parent directory did exist or
#     was successfully created, and the script failed to create the
#     file.
#   3 The storage_path setting in the config file is nonempty, the specified
#     directory does not exist and the script failed to create it.

logger "$0 starting"

configPath=~/.config/btsync/btsync.conf

# Parse arguments
if [[ $# > 0 ]]; then
    configPath=$1
    logger "Using config path $configPath given as positional parameter"
else
    logger "Using default config path $configPath"
fi

# Create config file if necessary
if [[ -f $configPath ]]; then
    logger "Config file $configPath already exists"
else
    logger "File $configPath does not exist - will create config file at this location"

    if mkdir -p $(dirname $configPath); then
        if /bin/bash /usr/share/btsync-autoconfig/btsync-makeconfig.sh > $configPath; then
            logger "Config file successfully created at $configPath!"
        else
            logger "Could not create config at $configPath - exiting"
            exit 2
        fi
    else
        logger "Could not create directory $(dirname $configPath) - exiting"
        exit 1
    fi
fi

# Create storage directory if necessary
storagePath=$(grep -E '"storage_path"\s*:' "$configPath" | cut -d : -f 2- | grep -oE '"[^"]*"' | grep -oE '[^"]*')
if [[ -d "$storagePath" ]]; then
    logger "Storage directory ${storagePath} already exists"
elif [[ -n "$storagePath" ]]; then
    logger "Storage directory ${storagePath} does not exist - will create it"
    if mkdir -p "$storagePath"; then
        logger "Storage directory ${storagePath} created successfully"
    else
        logger "Failed to create storage directory ${storagePath}"
        exit 3
    fi
fi
