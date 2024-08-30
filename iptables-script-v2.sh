#!/usr/bin/bash

#Clear existing rules
iptables -F
ip6tables -F

sudo ufw allow 22

#Allow traffic from localhost
iptables -I INPUT -p tcp -s localhost -j ACCEPT
ip6tables -I INPUT -p tcp -s localhost -j ACCEPT

iptables -I INPUT -s 178.92.82.0/24 -j DROP
iptables -I INPUT -s 94.179.240.0/24 -j DROP
iptables -I INPUT -s 31.41.95.0/24 -j DROP
iptables -I INPUT -s 83.86.164.0/24 -j DROP
iptables -I INPUT -s 178.123.23.0/24 -j DROP
iptables -I INPUT -s 79.132.20.27 -j DROP
iptables -I INPUT -s 95.158.151.2 -j DROP
iptables -I INPUT -s 87.121.243.38 -j DROP
iptables -I INPUT -s 212.72.195.5 -j DROP
iptables -I INPUT -s 78.142.51.58 -j DROP
iptables -I INPUT -s 88.87.0.179 -j DROP
iptables -I INPUT -s 77.70.47.96 -j DROP
iptables -I INPUT -s 77.70.103.186 -j DROP
iptables -I INPUT -s 77.78.22.70 -j DROP
iptables -I INPUT -s 91.92.177.156 -j DROP
iptables -I INPUT -s 91.92.177.142 -j DROP
iptables -I INPUT -s 91.148.150.59 -j DROP
iptables -I INPUT -s 91.148.150.30 -j DROP
iptables -I INPUT -s 212.233.234.0/24 -j DROP
iptables -I INPUT -s 212.233.213.0/24 -j DROP
iptables -I INPUT -s 212.233.133.0/24 -j DROP
iptables -I INPUT -s 84.54.145.143 -j DROP
iptables -I INPUT -s 87.121.241.49 -j DROP
iptables -I INPUT -s 87.121.240.236 -j DROP
iptables -I INPUT -s 87.121.241.234 -j DROP
iptables -I INPUT -s 87.121.239.240 -j DROP
iptables -I INPUT -s 87.120.185.234 -j DROP
iptables -I INPUT -s 109.199.148.105 -j DROP
iptables -I INPUT -s 91.148.150.111 -j DROP
iptables -I INPUT -s 78.83.92.236 -j DROP
iptables -I INPUT -s 213.222.47.113 -j DROP
iptables -I INPUT -s 93.123.50.237 -j DROP
iptables -I INPUT -s 85.239.139.9 -j DROP
iptables -I INPUT -s 77.70.14.122 -j DROP
#!/usr/bin/bash

# Clear existing rules
iptables -F
ip6tables -F

sudo ufw allow 22

# Allow SSH traffic
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
ip6tables -I INPUT -p tcp --dport 22 -j ACCEPT

# Allow traffic from localhost
iptables -I INPUT -s 127.0.0.1 -j ACCEPT
ip6tables -I INPUT -s ::1 -j ACCEPT

# Drop specific IP addresses
iptables -I INPUT -s 178.92.82.0/24 -j DROP
iptables -I INPUT -s 94.179.240.0/24 -j DROP
iptables -I INPUT -s 31.41.95.0/24 -j DROP
iptables -I INPUT -s 83.86.164.0/24 -j DROP
iptables -I INPUT -s 178.123.23.0/24 -j DROP
iptables -I INPUT -s 79.132.20.27 -j DROP
iptables -I INPUT -s 95.158.151.2 -j DROP
iptables -I INPUT -s 87.121.243.38 -j DROP
iptables -I INPUT -s 212.72.195.5 -j DROP
iptables -I INPUT -s 78.142.51.58 -j DROP
iptables -I INPUT -s 88.87.0.179 -j DROP
iptables -I INPUT -s 77.70.47.96 -j DROP
iptables -I INPUT -s 77.70.103.186 -j DROP
iptables -I INPUT -s 77.78.22.70 -j DROP
iptables -I INPUT -s 91.92.177.156 -j DROP
iptables -I INPUT -s 91.92.177.142 -j DROP
iptables -I INPUT -s 91.148.150.59 -j DROP
iptables -I INPUT -s 91.148.150.30 -j DROP
iptables -I INPUT -s 212.233.234.0/24 -j DROP
iptables -I INPUT -s 212.233.213.0/24 -j DROP
iptables -I INPUT -s 212.233.133.0/24 -j DROP
iptables -I INPUT -s 84.54.145.143 -j DROP
iptables -I INPUT -s 87.121.241.49 -j DROP
iptables -I INPUT -s 87.121.240.236 -j DROP
iptables -I INPUT -s 87.121.241.234 -j DROP
iptables -I INPUT -s 87.121.239.240 -j DROP
iptables -I INPUT -s 87.120.185.234 -j DROP
iptables -I INPUT -s 109.199.148.105 -j DROP
iptables -I INPUT -s 91.148.150.111 -j DROP
iptables -I INPUT -s 78.83.92.236 -j DROP
iptables -I INPUT -s 213.222.47.113 -j DROP
iptables -I INPUT -s 93.123.50.237 -j DROP
iptables -I INPUT -s 85.239.139.9 -j DROP
iptables -I INPUT -s 77.70.14.122 -j DROP
iptables -I INPUT -s 183.44.150.0/24 -j DROP
iptables -I INPUT -s 182.197.136.0/24 -j DROP
iptables -I INPUT -s 119.105.121.0/24 -j DROP

# Allow traffic from your own IPv4 and IPv6 addresses
iptables -I INPUT -p tcp -s $(curl ip.sb -4 -s) -j ACCEPT
ip6tables -I INPUT -p tcp -s $(curl ip.sb -6 -s) -j ACCEPT

# Allow traffic from Cloudflare IP ranges
for i in $(curl https://www.cloudflare.com/ips-v4 -s); do
  iptables -I INPUT -p tcp -m multiport -s $i --dports 80,443,2408 -j ACCEPT
done

for i in $(curl https://www.cloudflare.com/ips-v6 -s); do
  ip6tables -I INPUT -p tcp -m multiport -s $i --dports 80,443,2408 -j ACCEPT
done

# Allow additional ports
iptables -I INPUT -p tcp -m multiport --dports 888,8888 -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports 888,8888 -j ACCEPT

# Drop other traffic on specific ports
iptables -A INPUT -p tcp -m multiport --dports 80,443,2408,3306 -j DROP
ip6tables -A INPUT -p tcp -m multiport --dports 80,443,2408,3306 -j DROP

# Valve Anti-DDoS Rules
iptables -I INPUT -p udp --dport 27015 -m state --state NEW -m recent --name VALVE_ANTIDDOS --set
iptables -I INPUT -p udp --dport 27016 -m state --state NEW -m recent --name VALVE_ANTIDDOS --set
iptables -I INPUT -p udp --dport 27017 -m state --state NEW -m recent --name VALVE_ANTIDDOS --set

# Additional rules (simplified for brevity)
iptables -A INPUT -p udp -m string --algo kmp --hex-string '|fe fe fe fe fe|' --from 28 -j DROP
iptables -I INPUT 1 -p udp --sport 62305 --match string --algo kmp --hex-string '|77 70 61 64 2e 64 6f 6d 61 69 6e 2e 6e 61 6d 65|' -j DROP
iptables -I INPUT 1 -p udp --dport 62305 --match string --algo kmp --hex-string '|77 70 61 64 2e 64 6f 6d 61 69 6e 2e 6e 61 6d 65|' -j DROP
iptables -I INPUT 1 -p udp --sport 22 --match string --algo kmp --hex-string '|77 70 61 64 2e 64 6f 6d 61 69 6e 2e 6e 61 6d 65|' -j DROP
iptables -I INPUT 1 -p udp --dport 443 --match string --algo kmp --hex-string '|77 70 61 64 2e 64 6f 6d 61 69 6e 2e 6e 61 6d 65|' -j DROP
iptables -I INPUT 1 -p udp --sport 443 --match string --algo kmp --hex-string '|77 70 61 64 2e 64 6f 6d 61 69 6e 2e 6e 61 6d 65|' -j DROP
iptables -I INPUT 1 -p udp --dport 22 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT 1 -p udp --sport 62305 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT 1 -p udp --sport 22 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT 1 -p udp --dport 62305 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT 1 -p udp --dport 443 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT 1 -p udp --sport 443 --match string --algo kmp --hex-string '|Efbbbf30783030303230303031|' -j DROP
iptables -I INPUT -p udp -m udp -m string --hex-string "|ffffffff6765746368616c6c656e676520302022|" --algo kmp -j DROP
iptables -I INPUT -p udp -m udp -m string --hex-string "|00000000000000000000000000000000|" --algo kmp --from 32 --to 33 -j DROP
iptables -A INPUT -p udp -m udp --dport 20100:20500 -m state --state NEW -m recent --update --seconds 30 --hitcount 30 --name DEFAULT --rsource -j DROP
iptables -A INPUT -p udp -m udp --dport 20100:20500 -m state --state NEW -m recent --set --name DEFAULT --rsource
iptables -t mangle -A PREROUTING -p tcp ! --sport 53 -m set --match-set internal src -m state --state NEW -m recent --set
iptables -t mangle -A PREROUTING -p tcp ! --sport 53 -m set --match-set internal src -m state --state NEW -m recent --update --seconds 1000 --hitcount 5 -j DROP
iptables -t mangle -A PREROUTING -p udp ! --sport 53 -m set --match-set internal src -m state --state NEW -m recent --set
iptables -t mangle -A PREROUTING -p udp ! --sport 53 -m set --match-set internal src -m state --state NEW -m recent --update --seconds 1000 --hitcount 5 -j DROP
iptables -A INPUT -p udp -m string --algo kmp --hex-string "|fe fe fe fe fe|" --from 28 -j ovh_rape
iptables -A ovh_rape -m limit --limit 100/s --limit-burst 500 -j RETURN
iptables -A ovh_rape -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e43js9273sjks|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e432041545441434bjsobdisbs|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e4320464c4f4f44|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4841434b4552|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4841434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|736b6964|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|736b69646e6574|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4a554e4b2041545441434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4a554e4b20464c4f4f44|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|484f4c442041545441434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e43|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e432ee92041545441434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|434e4320464c4f4f44|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4841434b4552|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4841434b|" -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf30783030303230303031|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf30783030303230303031|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf30783030303230303031|" --algo bm --to 27017 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf307830303030303030303030433032313130|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf307830303030303030303030433032313130|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbf307830303030303030303030433032313130|" --algo bm --to 27017 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbf307830303030303030303030433032313130|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbf307830303030303030303030433032313130|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbf307830303030303030303030433032313130|" --algo bm --to 27017 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbf30783030363030453030|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbf30783030363030453030|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbf30783030363030453030|" --algo bm --to 27017 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbf30783030363030453038|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbf30783030363030453038|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbf30783030363030453038|" --algo bm --to 27017 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbfefbbbf30783030303230303031|" --algo bm --to 27015 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbfefbbbf30783030303230303031|" --algo bm --to 27016 -j DROP
iptables -A INPUT -m string --hex-string "|efbbbfefbbbfefbbbfefbbbfefbbbf30783030303230303031|" --algo bm --to 27017 -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|44444f5344444f5344444f53|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4d4f354f4e354f4e354f4e354f4a354e4835563555|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|544350|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4845584154544b212121212121|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|424f544e4554|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|424f4f5445524e4554|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|41545441434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|504f574552|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|6c6e6f6172656162756e63686f66736b696464696573|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|736b6964|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|736b69646e6574|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4a554e4b2041545441434b|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|4a554e4b20464c4f4f44|" -j DROP
iptables -A INPUT -p udp -m string --algo bm --hex-string "|484f4c442041545441434b|" -j DROP
sudo iptables -I INPUT -p udp -m udp -m string --hex-string "|ffbbbfefbbbeffbbbfebffffefbbbf30783030303230303031|" --algo kmp -j DROP
sudo iptables -I INPUT -p udp -m udp -m string --hex-string "|f0ffffffef6765746368616c6c656e676520302022|" --algo kmp -j ACCEPT
iptables -A INPUT -p udp -m u32 --u32 "22&0xFFFF=0x0008" -j DROP
iptables -A INPUT -p udp -m u32 --u32 "28 & 0x00FF00FF = 0x00200020 && 32 & 0x00FF00FF = 0x00200020 && 36 & 0x00FF00FF = 0x00200020 && 40 & 0x00FF00FF = 0x00200020" -j DROP
iptables -A INPUT -p tcp -m u32 --u32 "22&0xFFFF=0x0008" -j DROP
iptables -A INPUT -p tcp -m u32 --u32 "28 & 0x00FF00FF = 0x00200020 && 32 & 0x00FF00FF = 0x00200020 && 36 & 0x00FF00FF = 0x00200020 && 40 & 0x00FF00FF = 0x00200020" -j DROP
iptables -t raw -A PREROUTING -p udp -m length --length 65535 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 60000 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 30000 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 10000 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 4096 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 3048 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 2570 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 2024 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1878 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1732 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1658 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1616 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1544 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1480 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1452 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1398 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1380 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1326 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1298 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1256 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1200 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1150 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1116 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1098 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1078 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 1024 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 996 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 968 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 942 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 920 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 898 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 888 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 884 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 868 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 840 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 812 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 786 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 764 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 756 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 746 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 726 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 702 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 694 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 682 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 666 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 656 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 648 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 638 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 622 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 612 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 594 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 576 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 562 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 552 -j DROP #Botnet-UDP Payload
iptables -t raw -A PREROUTING -p udp -m length --length 536 -j DROP #Botnet-UDP Payload
iptables -A INPUT -p udp -m u32 --u32 "22&0xFFFF=0x0008" -j DROP
iptables -A INPUT -p udp -m u32 --u32 "28 & 0x00FF00FF = 0x00200020 && 32 & 0x00FF00FF = 0x00200020 && 36 & 0x00FF00FF = 0x00200020 && 40 & 0x00FF00FF = 0x00200020" -j DROP
iptables -A INPUT -p tcp -m u32 --u32 "22&0xFFFF=0x0008" -j DROP
iptables -A INPUT -p tcp -m u32 --u32 "28 & 0x00FF00FF = 0x00200020 && 32 & 0x00FF00FF = 0x00200020 && 36 & 0x00FF00FF = 0x00200020 && 40 & 0x00FF00FF = 0x00200020" -j DROP
iptables -A INPUT -p udp -m u32 --u32 "12&0xFFFFFF00=0xC0A80F00" -j DROP
iptables -A INPUT -p udp -m length --length 28 -m string --algo bm --string "0x0010" -j DROP
iptables -A INPUT -p udp -m length --length 28 -m string --algo bm --string "0x0000" -j DROP
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state INVALID -j DROP
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 443 -m state --state INVALID -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 31337 --sport 31337 -j DROP
iptables -A FORWARD -o eth0 -p tcp --dport 31337 --sport 31337 -j DROP
iptables -I QUERY-CHECK -p ah -j DROP
iptables -I QUERY-CHECK -p esp -j DROP
iptables -I QUERY-CHECK -p gre -j DROP
iptables -I QUERY-CHECK -p ICMP -j DROP
iptables -t mangle -A PREROUTING -m conntrack --ctstate INVALID -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,ACK FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -t mangle -A PREROUTING -s 224.0.0.0/3 -j DROP
iptables -t mangle -A PREROUTING -s 169.254.0.0/16 -j DROP
iptables -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP
iptables -t mangle -A PREROUTING -s 192.0.2.0/24 -j DROP
iptables -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP
iptables -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP
iptables -t mangle -A PREROUTING -s 0.0.0.0/8 -j DROP
iptables -t mangle -A PREROUTING -s 240.0.0.0/5 -j DROP
iptables -t mangle -A PREROUTING -s 127.0.0.0/8 ! -i lo -j DROP
iptables -t mangle -A PREROUTING -f -j DROP
iptables -A INPUT -p tcp -m connlimit --connlimit-above 111 -j REJECT --reject-with tcp-reset
iptables -A INPUT -p tcp --tcp-flags RST RST -m limit --limit 2/s --limit-burst 2 -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m limit --limit 60/s --limit-burst 20 -j ACCEPT
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -j DROP
iptables -N port-scanning
iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN
iptables -A port-scanning -j DROP

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

#Accept all input connection on loopback
iptables -A INPUT -i lo -j ACCEPT

#Drop any spoof on my loopack interface.
iptables -A INPUT ! -i lo -d 127.0.0.1/8 -j DROP

#Allow VMs and network devices to accept forwarded packet. (Router-On-A-Stick)
iptables -A FORWARD -j ACCEPT

#DROP SPOOF, no spoof allowed on this server
iptables -A INPUT -s 224.0.0.0/4 -j DROP
iptables -A INPUT -d 224.0.0.0/4 -j DROP
iptables -A INPUT -s 240.0.0.0/5 -j DROP
iptables -A INPUT -d 240.0.0.0/5 -j DROP
iptables -A INPUT -s 0.0.0.0/8 -j DROP
iptables -A INPUT -d 0.0.0.0/8 -j DROP
iptables -A INPUT -d 239.255.255.0/24 -j DROP
iptables -A INPUT -d 255.255.255.255 -j DROP

#Drop all invalid packet, we know what we do to hacker's crafted, forged packet, we DROP 'em!
iptables -A INPUT -m state --state INVALID -j DROP

#wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'

#DROP ATTACKS
#for SMURF attack protection
iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/second -j DROP

#Droping all invalid packets
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

#flooding of RST packets, smurf attack Rejection
iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit-burst 2 -j ACCEPT

#Protecting portscans
#Attacking IP will be locked for 24 hours (3600 x 24 = 86400 Seconds)
iptables -A INPUT -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP

#Remove attacking IP after 24 hours
iptables -A INPUT -m recent --name portscan --remove
iptables -A FORWARD -m recent --name portscan --remove

#Add port(s) to be monitored and protected. Below monitored SSH(22), EMAIL(25), SMB (139,445) and ASTERISK/VOIP (5060)
PROTECTED=22,25,139,5060

#Detect and log scanners, add them to the portscan list, and log the attempt.
iptables -A INPUT -p tcp -m tcp -m multiport --dports $PROTECTED -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A INPUT -p tcp -m tcp -m multiport --dports $PROTECTED -m recent --name portscan --set -j DROP

iptables -A FORWARD -p tcp -m tcp -m multiport --dports $PROTECTED -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A FORWARD -p tcp -m tcp -m multiport --dports $PROTECTED -m recent --name portscan --set -j DROP

#TRIGGERS, flashes your keyboard LED or Computer LED for any Intruder or Hacking Alert.
#iptables -A INPUT -p tcp --dport 22 -j LED --led-trigger-id ssh --led-always-blink
#iptables -A INPUT -p tcp --dport 25 -j LED --led-trigger-id smtp --led-always-blink
#iptables -A INPUT -p tcp --dport 139 -j LED --led-trigger-id rpc --led-always-blink

#echo netfilter-ssh >/sys/class/leds/ssh/trigger
#echo netfilter-ssh >/sys/class/leds/rpc/trigger
#echo netfilter-ssh >/sys/class/leds/smtp/trigger

#CREATE TABLE_FUNCTION
iptables -N RouterDATA
iptables -N FireWALLED
iptables -N ACL-WEB
iptables -N ACL-WEB-SECURE
iptables -N BLOCKED-DATA
iptables -N MAIL-ROUTE
iptables -N AUDIT_DROP

#ALLOW CNNECTION THRU ROUTER
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j RouterDATA
iptables -A INPUT -p tcp --dport 9400 -j ACCEPT

#RouterDATA is the gateway, define what rule-set handles what packet coming from the RouterDATA
#iptables -N RouterDATA
iptables -A RouterDATA -p tcp --dport http -j ACL-WEB
iptables -A RouterDATA -p tcp --dport http -j ACL-WEB-SECURE
iptables -A RouterDATA -p udp --sport 67:68 --dport 67:68 -j FireWALLED
iptables -A RouterDATA -p udp --sport 53 --dport 53 -m limit --limit 10/minute -j LOG --log-prefix "Port 53 Possible Exploit Detected :"
iptables -A RouterDATA -m limit --limit 10/minute -j LOG --log-prefix "Router Throutled:"
iptables -A RouterDATA -p tcp -m multiport --dports smtp,smtps,imap,imaps,pop3 -j MAIL-ROUTE
iptables -A RouterDATA -m state --state ESTABLISHED,RELATED -j FireWALLED
iptables -A RouterDATA -j DROP
iptables -A INPUT -j RouterDATA

#Define Administrative Access Level rules, allow certain IP to connect and manages the server.
iptables -N ACL-16
#iptables -A ACL-16 -p tcp --dport 1234 -j RETURN
#iptables -A ACL-16 -s xxx.xxx.xxx.xxx -j RETURN
#iptables -A ACL-16 -s xxx.xxx.xxx.xxx -j RETURN
#iptables -A ACL-16 -s xxx.xxx.xxx.xxx -j RETURN
iptables -A ACL-16 -j RouterDATA
iptables -A ACL-16 -j DROP

#Allow administrative IP to go thru ACL-16
iptables -A INPUT -j ACL-16

#GET SYN FLOOD PROTECTION
iptables -N SYN-FLOOD
iptables -A SYN-FLOOD -m limit --limit 1/s --limit-burst 4 -j LOG --log-prefix "PUNK! YOUR SYN-FLOOD IS LOGGED :"
iptables -A SYN-FLOOD -j REJECT
iptables -A INPUT -p tcp --syn -j SYN-FLOOD

#DEFINE WHAT GOES THROUGH FIREWALL
iptables -N FireWALLED
iptables -A FireWALLED -m state --state NEW -j REJECT
iptables -A FireWALLED -m state --state INVALID -j REJECT
iptables -A FireWALLED -m limit --limit 15/minute -j LOG --log-prefix "You are FireWALLED: "
iptables -A FireWALLED -p tcp --dport http -j ACL-WEB
#iptables -A FireWALLED -p tcp -m multiport --dports smtp,smtps,imap,imaps,pop3 -j MAIL-ROUTE

iptables -A FireWALLED -p tcp --dport https -j ACL-WEB-SECURE
iptables -A FireWALLED -m recent --name INTRUDER --rcheck --seconds 60 -j REJECT
iptables -A FireWALLED -p tcp --dport 139 -m recent --name INTRUDER --set -j REJECT
iptables -A FireWALLED -p tcp --dport 137 -m recent --name INTRUDER --set -j REJECT
iptables -A FireWALLED -m recent --name INTRUDER --rcheck --seconds 60 -j REJECT
iptables -A FireWALLED -p tcp --dport 22 -m recent --name INTRUDER --set -j REJECT

#WE NEED EMAIL TO WORK AND PROTECTED, HERE YOU GO
#If you receive more than 5 emails in 1 minutes, it's spamming, log it and filter out for auto blocking .
iptables -A MAIL-ROUTE -p tcp -m limit --limit 3/minute -j LOG --log-prefix "Damn Spammer! :"
iptables -A MAIL-ROUTE -p tcp -m multiport --dports smtp,smtps,imap,imaps,pop3 -j ACCEPT
iptables -A MAIL-ROUTE -j DROP

#SETUP AN AUDITOR
iptables -N AUDIT_DROP
iptables -A AUDIT_DROP -j AUDIT --type drop
iptables -A AUDIT_DROP -j DROP
iptables -A INPUT -j AUDIT_DROP

#TRIGGERS
iptables -A FireWALLED -p tcp --dport 22 -j LED --led-trigger-id ssh --led-always-blink
iptables -A FireWALLED -p tcp --dport 25 -j LED --led-trigger-id smtp --led-always-blink
iptables -A FireWALLED -p tcp --dport 139 -j LED --led-trigger-id rpc

iptables -A FireWALLED -p tcp --dport 80 -m string --algo bm --string 'GET /index.html' -j LOG

#RESTRICt CONNECTION PER CLIENT to avoid BOTNET Throuthling

iptables -A FireWALLED -p tcp --syn -m connlimit --connlimit-above 11 --connlimit-mask 24 -j REJECT
iptables -A FireWALLED -p tcp --syn --dport 80 -m connlimit --connlimit-above 10 --connlimit-mask 24 -j REJECT
iptables -A FireWALLED -p tcp --syn --dport 25 -m connlimit --connlimit-above 2 --connlimit-mask 24 -j REJECT
iptables -A FireWALLED -p tcp --syn --dport 23 -m connlimit --connlimit-above 2 --connlimit-mask 24 -j REJECT
iptables -A FireWALLED -p tcp --syn --dport 9400 -m connlimit --connlimit-above 3 --connlimit-mask 24 -j REJECT

#ACCEPT ONLY CONNECTION THAT PASSED ROUTERS FIREWALLeD RULES, DROP the rest;
iptables -A FireWALLED -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FireWALLED -j DROP

#CREATE ACCESS CONTROL LEVEL for connection to the website(s)
#iptables -N ACL-WEB
iptables -A ACL-WEB -p tcp --dport http -j ACCEPT

#Limit connection to per client connecting to the website, drop dummy connection saves bandwidth
iptables -A ACL-WEB -p tcp --syn --dport 80 -m connlimit --connlimit-above 10 --connlimit-mask 24 -j REJECT
iptables -A ACL-WEB -j DROP

#Allow all connection to website port http goes through ACL-WEB (Access Control Level for Web)
iptables -A INPUT -p tcp --dport http -j ACL-WEB

#iptables -N ACL-WEB-SECURE
iptables -A ACL-WEB-SECURE -p tcp --dport https -j ACCEPT
iptables -A ACL-WEB -p tcp --syn --dport 443 -m connlimit --connlimit-above 10 --connlimit-mask 24 -j REJECT

#Allow all connection to website port https goes through ACL-WEB SECURE (Access Control Level for Web)
iptables -A ACL-WEB-SECURE -j DROP

#Allow all connection to website port https goes through ACL-WEB-SECURE (Access Control Level for secure Web)
iptables -A INPUT -p tcp --dport https -j ACL-WEB-SECURE

#Monitors connections to your server and block and lock hacking flags.
#Blocks any IP address that hit the server 10 times within a minute with any of HACKING FLAG.
#See the blocked IP Address using grep -i "BLOCKED-DATA :" /var/location/of/your/iptable.log
#iptables -N BLOCKED-DATA;
iptables -A BLOCKED-DATA -m limit --limit 10/minute -j LOG --log-prefix "BLOCKED-DATA : "

#BLOCK HACKING FLAGS, drop their incoming packets.
iptables -A BLOCKED-DATA -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags FIN,RST SYN,RST -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags ALL ALL -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags ALL NONE -j DROP
iptables -A BLOCKED-DATA -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -A BLOCKED-DATA -j DROP

#Monitors connection to the server with hacking flags goes through BLOCKED-DATA
iptables -A INPUT -p tcp -j BLOCKED-DATA

#ALLOW CONNECTION prevent dns hi-jacking, only connection from known source port and destination port is allowed thru RouterDATA
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j RouterDATA

#Hide your VM (Virtual Machines) or network from the real world, but allow them to access the world masqueradly.
iptables -t nat -A POSTROUTING -s 172.30.80.248/29 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.19.35.248/29 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.21.44.248/29 -j MASQUERADE

#Automatically append blacklisted IP addresses to our database, keep spammers, script kiddies and tor users etc off my network.
#wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'

sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

sudo ufw allow 22

#DROP ALL CONNECTION THAT DOESNT MATCH OUR RULES
iptables -A INPUT -j DROP

sudo ufw allow 22
