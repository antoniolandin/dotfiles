extractPorts () {
    ports=$(cat $1 | pcregrep -o1 --buffer-size 1000000 '(\d{1,5})\/open\/' | sed -E ':a;N;$!ba;s/\n/,/g')

    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address" >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n" >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n" >> extractPorts.tmp
    bat extractPorts.tmp
    rm extractPorts.tmp
}

extractHosts () {
    hosts=$(cat $1 | pcregrep -o1 '^Host:\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' | uniq | sort -t . -n)
    echo $hosts > hosts.tmp
    bat hosts.tmp
    rm hosts.tmp
}

wlanIp () {
    ip_mask=$(ip a | pcregrep --om-separator=" " -o1 -o2 "^\s|\t*inet\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/(\d{1,2}).+wlan0$")

    ip=$(echo $ip_mask | awk '{print $1}')
    mask=$(echo $ip_mask | awk '{print $2}')
    
    echo -e "\033[0;35m$ip\033[0m\033[0;34m/\033[0m\033[1;33m$mask\033[0m"
    echo $ip | xclip -r -sel c
}
