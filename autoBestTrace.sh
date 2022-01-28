#!/bin/bash

OSARCH=$(uname -m)
case $OSARCH in 
    x86_64)
        BINTAG=""
        ;;
    i*86)
        BINTAG="32"
        ;;
    arm64|aarch64)
        BINTAG="arm"
        ;;
    *)
        echo "unsupported OSARCH: $OSARCH"
        exit 1
        ;;
esac

# install besttrace
if [ ! -f "besttrace2021" ]; then

    wget -O besttrace2021 "https://github.com/nyjx/autoBestTrace/raw/main/besttrace4linux/besttrace${BINTAG}"

    chmod +x besttrace2021
fi

## start to use besttrace

next() {
    printf "%-70s\n" "-" | sed 's/\s/-/g'
}

clear
next

ip_list=(14.215.116.1 202.96.209.133 117.28.254.129 113.207.25.138 119.6.6.6 120.204.197.126 183.221.253.100 202.112.14.151)
ip_addr=(广州电信 上海电信 厦门电信 重庆联通 成都联通 上海移动 成都移动 成都教育网)

# ip_len=${#ip_list[@]}

for i in {0..7}; do
    echo ${ip_addr[$i]}
    ./besttrace2021 -q 1 ${ip_list[$i]}
    next
done
