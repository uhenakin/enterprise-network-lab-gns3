# apr/19/2026 04:35:41 by RouterOS 6.49.19
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=vpn-pool ranges=172.16.1.2-172.16.1.10
/ppp profile
add local-address=172.16.1.1 name=vpn-profil remote-address=vpn-pool
/routing ospf instance
set [ find default=yes ] distribute-default=if-installed-as-type-2 router-id=\
    1.1.1.1
/interface l2tp-server server
set authentication=mschap2 enabled=yes ipsec-secret=vpn123 use-ipsec=yes
/ip address
add address=10.10.10.2/30 interface=ether1 network=10.10.10.0
add address=10.10.30.1/30 interface=ether3 network=10.10.30.0
add address=10.10.20.2/30 interface=ether2 network=10.10.20.0
/ip dns
set servers=8.8.8.8,1.1.1.1
/ip firewall filter
add action=accept chain=input dst-port=500 in-interface=ether1 protocol=udp
add action=accept chain=input dst-port=4500 in-interface=ether1 protocol=udp
add action=accept chain=input dst-port=1710 in-interface=ether1 protocol=udp
add action=accept chain=forward in-interface=ether1 protocol=ipsec-esp
/ip firewall mangle
add action=mark-connection chain=prerouting dst-address-type=local \
    in-interface=ether3 new-connection-mark=ISP1_conn passthrough=yes \
    per-connection-classifier=!both-addresses:2/0
add action=mark-connection chain=prerouting dst-address-type=local \
    in-interface=ether3 new-connection-mark=ISP2_conn passthrough=yes \
    per-connection-classifier=!both-addresses:2/1
add action=mark-routing chain=prerouting dst-port=500 new-routing-mark=\
    to_ISP1 passthrough=no protocol=udp
add action=mark-routing chain=prerouting dst-port=1701 new-routing-mark=\
    to_ISP1 passthrough=no protocol=udp
add action=mark-routing chain=prerouting dst-port=4500 new-routing-mark=\
    to_ISP1 passthrough=no protocol=udp
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether2
add action=accept chain=srcnat dst-address=172.16.10.0/24
/ip route
add distance=1 gateway=10.10.10.1 routing-mark=to_ISP1
add check-gateway=ping distance=2 gateway=10.10.20.1
/ppp secret
add name=branch password=123 profile=vpn-profil service=l2tp
/routing ospf network
add area=backbone network=10.10.30.0/30
/system identity
set name=Router-Edge
/tool romon
set enabled=yes
