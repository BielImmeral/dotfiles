media=$(playerctl metadata --format '{{ artist }} - {{ title }}')

if [ -z "$media" ]; then 
	echo "{\"text\": \"\"}"
else
	echo "{\"text\": \"$media\"}"; 
fi
