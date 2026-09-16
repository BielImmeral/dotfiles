opcao=$(printf "Desligar\nReiniciar\nSuspender\nHibernar" | rofi -dmenu -p "Power")
if [ "$opcao" == "Desligar" ]; then systemctl poweroff; fi
if [ "$opcao" == "Reiniciar" ]; then systemctl reboot; fi
if [ "$opcao" == "Suspender" ]; then systemctl suspend; fi
if [ "$opcao" == "Hibernar" ]; then systemctl hibernate; fi
