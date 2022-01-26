

[ -f "/etc/apt/sources.list" ] && mv /etc/apt/sources.list /etc/apt/sources.list.bak

# buster
cat << EOF > /etc/apt/sources.list
deb http://mirrors.jd.com/debian/ buster main contrib non-free
deb http://mirrors.jd.com/debian/ buster-updates main contrib non-free
deb http://mirrors.jd.com/debian/ buster-backports main contrib non-free
deb-src http://mirrors.jd.com/debian/ buster main contrib non-free
deb-src http://mirrors.jd.com/debian/ buster-updates main contrib non-free
deb-src http://mirrors.jd.com/debian/ buster-backports main contrib non-free
EOF


# jessie

# stretch