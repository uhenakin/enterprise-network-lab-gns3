# apr/19/2026 04:42:06 by RouterOS 6.49.19
# software id = 
#
#
#
/interface bridge
add name=BR-Local
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=BR-Local name=dhcp1
/interface bridge port
add bridge=BR-Local interface=ether3
add bridge=BR-Local interface=ether2
add bridge=BR-Local interface=ether4
/ip address
add address=10.70.70.2/29 interface=ether1 network=10.70.70.0
add address=192.168.1.1/24 interface=BR-Local network=192.168.1.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip firewall nat
add action=masquerade chain=srcnat
/ip route
add distance=1 gateway=10.70.70.1
/system identity
set name=Distribusi-1
/tool romon
set enabled=yes
