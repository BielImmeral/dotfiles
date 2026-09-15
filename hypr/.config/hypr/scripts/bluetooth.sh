
if ! bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power on
fi

devices=""



while read -r mac name; do

    connected=$(bluetoothctl info "$mac" | grep "Connected:" | awk '{print $2}')

    if [ "$connected" = "yes" ]; then
        devices+="  $name  [CONECTADO]  [$mac]"
    else
        devices+="  $name  [$mac]"
    fi

    devices+=$'\n'

done < <(bluetoothctl devices | sed 's/^Device //')




selected=$(printf '%s' "$devices" | rofi -dmenu -i -p "Bluetooth")

[ -z "$selected" ] && exit 0

mac=$(echo "$selected" | grep -oE '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}')

[ -z "$mac" ] && exit 1



if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
    bluetoothctl disconnect "$mac"
else
    bluetoothctl connect "$mac"
fi
