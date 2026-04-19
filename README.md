Enterprise Network Lab – MikroTik Simulation – GNS3
📌 Project Overview

This project is a simulation of an enterprise network design using MikroTik RouterOS in a hierarchical architecture model:

Edge Layer (Security & Internet Gateway)
Core Layer (Routing Backbone)
Distribution Layer (User Aggregation)
Branch Layer (VLAN Segmentation)

The lab demonstrates routing, security, VLAN segmentation, VPN, and ISP redundancy implementation.

# Network Architecture
🔹 Edge Router (Internet Gateway & Security)

Main functions:

Internet gateway
Centralized firewall
Dual ISP load balancing & failover
VPN termination

Features:

OSPF
L2TP Server
IPsec Encryption
PCC Load Balancing
Automatic Failover
NAT Masquerade
Firewall Filter Rules
Mangle Rules (Connection & Routing Mark)

All outbound traffic passes through this router.

🔹 Core Router (Routing Backbone)

Main functions:

Internal routing backbone
Connects Edge, Distribution, and Branch routers

Characteristics:

OSPF enabled
No NAT
No firewall filtering
Focused on routing performance

Design principle:
Security at the Edge, Routing at the Core.

🔹 Core Router (Routing Backbone)
Main functions:
Internal routing backbone
Connects Edge, Distribution, and Branch routers
Characteristics:
OSPF enabled
No NAT
No firewall filtering
Focused on routing performance

Design principle:
Security at the Edge, Routing at the Core.

🔹 Distribution Layer

The distribution layer is divided into:
Distribution Aggregation Router
Role:
Connects Core to Distribution access routers
Acts as routing aggregation point
OSPF participation
Characteristics:
OSPF enabled
No NAT
No firewall
No DHCP
Pure routing function
Uses point-to-point /30 subnets for routing efficiency.

Distribution-1 (Access Layer)
LAN Network:
192.168.1.0/24
Gateway: 192.168.1.1
Services:
DHCP Server for local users
OSPF participation
Dynamic route learning from Core
Acts as gateway and IP assignment server for subnet 192.168.1.0/24.

Distribution-2 (Access Layer)
LAN Network:
192.168.2.0/24
Gateway: 192.168.2.1
Services:
DHCP Server for local users
OSPF participation
Dynamic route learning from Core
Acts as gateway and IP assignment server for subnet 192.168.2.0/24.

🔹 Branch Router
Main functions:

Branch gateway
VLAN segmentation
Inter-VLAN routing

VLANs:

VLAN 10 → 192.168.10.0/24
VLAN 20 → 192.168.20.0/24
VLAN 30 → 192.168.30.0/24

Features:

Trunk configuration to switch
OSPF to Core
Inter-VLAN routing
Routing Design
Dynamic routing using OSPF
No static routes
Automatic route exchange
Scalable design

Traffic flow:

User → Distribution/Branch → Core → Edge → ISP → Internet

# Internet Redundancy
Dual ISP configuration using:

PCC (Per Connection Classifier)
Mangle rules (connection marking)
Routing mark for traffic distribution
Automatic failover when ISP is down
Security Model
Firewall only on Edge
NAT only on Edge
Clean internal routers (no filtering)
VPN terminated at Edge
VLAN segmentation for network isolation

Design approach:

Centralized Security
Distributed Routing
Hierarchical Enterprise Model

# Tools Used
GNS3
MikroTik RouterOS
VPCS
Ubuntu (testing/server)

# Project Purpose
This lab was built to practice and demonstrate:

Enterprise network design
Multi-router OSPF implementation
VLAN & trunk configuration
ISP load balancing & failover
VPN configuration (L2TP + IPsec)
Centralized firewall & NAT

# Future Improvements
OSPF multi-area
Monitoring system (Zabbix / The Dude)
QoS & traffic shaping
Redundant core
High availability edge

# Author
Built as part of continuous learning in Network Engineering (Routing, Security, VLAN, and Enterprise Design using MikroTik).
