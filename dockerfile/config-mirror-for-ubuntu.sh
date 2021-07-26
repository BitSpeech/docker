
function echo_red {
    echo -e "\033[31m$1\033[0m"
}

function echo_green {
    echo -e "\033[32m$1\033[0m"
}

function log_error_and_exit {
    echo_red "ERROR: $1"
    exit 1
}

# check OS
os_version=""
grep -i "Ubuntu 18.04" /etc/issue > /dev/null && os_version="Ubuntu 18.04"
grep -i "Ubuntu 16.04" /etc/issue > /dev/null && os_version="Ubuntu 16.04"
grep -i "Ubuntu 14.04" /etc/issue > /dev/null && os_version="Ubuntu 14.04"

if [ ! -n "${os_version}" ] ;then
    log_error_and_exit "Only Ubuntu 18.04, 16.04, 14.04 are supported"
else
    echo_green "OS: ${os_version}"
fi


echo_green "Update /etc/apt/sources.list"
[ -f "/etc/apt/sources.list" ] && mv /etc/apt/sources.list /etc/apt/sources.list.bak

if [ "$os_version" == "Ubuntu 18.04" ] ;then
    cat << EOF > /etc/apt/sources.list
deb http://mirrors.jd.com/ubuntu/ bionic main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ bionic-backports main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ bionic-proposed main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ bionic-security main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ bionic-updates main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ bionic main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ bionic-backports main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ bionic-proposed main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ bionic-security main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ bionic-updates main multiverse restricted universe
EOF
elif [ "$os_version" == "Ubuntu 16.04" ] ;then
    cat << EOF > /etc/apt/sources.list
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb http://mirrors.idc.jd.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.idc.jd.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.idc.jd.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.idc.jd.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.idc.jd.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.idc.jd.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://mirrors.idc.jd.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.idc.jd.com/ubuntu/ xenial-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.idc.jd.com/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.idc.jd.com/ubuntu/ xenial-proposed main restricted universe multiverse
EOF
elif [ "$os_version" == "Ubuntu 14.04" ] ;then
    cat << EOF > /etc/apt/sources.list
deb http://mirrors.jd.com/ubuntu/ trusty main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ trusty-backports main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ trusty-proposed main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ trusty-security main multiverse restricted universe
deb http://mirrors.jd.com/ubuntu/ trusty-updates main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ trusty main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ trusty-backports main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ trusty-proposed main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ trusty-security main multiverse restricted universe
deb-src http://mirrors.jd.com/ubuntu/ trusty-updates main multiverse restricted universe
EOF
fi
