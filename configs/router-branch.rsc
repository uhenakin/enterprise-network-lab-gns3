# apr/19/2026 04:41:06 by RouterOS 6.49.19
# software id = 
#
#
#
/interface vlan
add interface=ether2 name="vlan 10" vlan-id=10
add interface=ether2 name="vlan 20" vlan-id=20
add interface=ether2 name="vlan 30" vlan-id=30
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool1 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool2 ranges=192.168.30.2-192.168.30.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface="vlan 10" name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface="vlan 20" name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface="vlan 30" name=dhcp3
/routing ospf instance
set [ find default=yes ] router-id=3.3.3.3
/ip address
add address=10.20.20.2/30 interface=ether1 network=10.20.20.0
add address=192.168.10.1/24 interface="vlan 10" network=192.168.10.0
add address=192.168.20.1/24 interface="vlan 20" network=192.168.20.0
add address=192.168.30.1/24 interface="vlan 30" network=192.168.30.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.20.0/24 gateway=192.168.20.1
add address=192.168.30.0/24 gateway=192.168.30.1
/ip dns
set servers=8.8.8.8,1.1.1.1
/ip firewall nat
add action=masquerade chain=srcnat
/routing ospf network
add area=backbone network=10.20.20.0/30
/system identity
set name=Router-Branch
/tool romon
set enabled=yes
