# apr/19/2026 04:38:13 by RouterOS 6.49.19
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing ospf instance
set [ find default=yes ] distribute-default=if-installed-as-type-2 router-id=\
    2.2.2.2
/ip address
add address=10.10.30.2/30 interface=ether1 network=10.10.30.0
add address=10.20.20.1/30 interface=ether2 network=10.20.20.0
add address=10.20.30.1/30 interface=ether3 network=10.20.30.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dns
set servers=8.8.8.8,1.1.1.1
/routing ospf network
add area=backbone network=10.10.30.0/30
add area=backbone network=10.20.20.0/30
add area=backbone network=10.20.30.0/30
/system identity
set name=Router-Core
/tool romon
set enabled=yes
