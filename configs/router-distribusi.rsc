# apr/19/2026 04:39:50 by RouterOS 6.49.19
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing ospf instance
set [ find default=yes ] router-id=4.4.4.4
/ip address
add address=10.20.30.2/30 interface=ether1 network=10.20.30.0
add address=10.70.70.1/29 interface=ether2 network=10.70.70.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dns
set servers=8.8.8.8
/ip firewall nat
add action=masquerade chain=srcnat
/routing ospf network
add area=backbone network=10.10.30.0/30
add area=backbone network=10.10.20.0/30
add area=backbone network=10.20.30.0/30
/system identity
set name=Router-Distribusi
/tool romon
set enabled=yes
