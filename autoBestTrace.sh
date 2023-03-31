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

ip_list=(113.108.209.1 210.21.4.130 211.139.129.5)
ip_addr=(广州电信 广州联通 广州移动)

# ip_len=${#ip_list[@]}

for i in {0..7}; do
    echo ${ip_addr[$i]}
    ./besttrace2021 -q 1 ${ip_list[$i]}
    next
done
