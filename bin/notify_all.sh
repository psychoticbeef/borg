#!/bin/bash -e
notify_all() {
        local title="$1"
        local msg="$2"

        who | awk '{print $1, $NF}' | tr -d "()" |
                while read u d; do
                        id=$(id -u $u)
                        #. /run/user/$id/bus
                        export DBUS_SESSION_BUS_ADDRESS
                        export DISPLAY=$d
                        su $u -c "/usr/bin/notify-send '$title' '$msg'"
                done
}

notify_all "$1" "$2"
