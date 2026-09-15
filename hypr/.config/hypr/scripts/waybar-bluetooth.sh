if ! bluetoothctl show | grep -q "Powered: yes"; then
    echo '{"text":"󰂲","tooltip":"Bluetooth desligado","class":"disabled"}'
    exit
fi

connected=$(bluetoothctl devices Connected)

if [ -n "$connected" ]; then
    name=$(echo "$connected" | sed 's/^Device [^ ]* //')

    echo "{\"text\":\"󰂱\", \"tooltip\":\"$name conectado\", \"class\":\"connected\"}"
else
    echo '{"text":"","tooltip":"Bluetooth ligado","class":"on"}'
fi
