NETWORK=$(nmcli -t -f SSID dev wifi list | sed  '/^$/d' | sort -u | rofi -dmenu -i -p "Wi-FI")

[ -z "$NETWORK" ] && exit 0

if nmcli -t -f NAME connection show | grep -Fxq "$NETWORK"; 
	then nmcli connection up "$NETWORK"
	exit 0
fi

SECURITY=$(nmcli -t -f SSID,SECURITY dev wifi list | grep -F "$NETWORK:" | head -n1 | cut -d: -f2)

if echo  "$SECURITY" | grep -qi "802.1X" ;
	then IDENTITY=$(rofi -dmenu -p "Matrícula")
	[ -z "$IDENTITY" ] && exit 0

	PASSWORD=$(rofi -dmenu -p "Senha")
	[ -z "$PASSWORD" ] && exit 0 

	nmcli connection add \
	type wifi \
	con-name "$NETWORK" \
	ifname "*" \
	ssid "$NETWORK" \
	wifi-sec.key-mgmt wpa-eap \
	802-1x.eap peap \
	802-1x.phase2-auth mschapv2 \
	802-1x.identity "$IDENTITY" \
	802-1x.password "$PASSWORD" \
	802-1x.system-ca-certs no

	nmcli connection up "$NETWORK"

else
	PASSWORD=$(rofi -dmenu -p "Senha")
	[ -z "$PASSWORD" ] && exit 0 

	nmcli device wifi connect "$NETWORK" password "$PASSWORD"

fi
