IPv4 & Networking – Quick Summary

IPv4: An IPv4 address is 32 bits, written as 4 octets (e.g. 192.168.1.25). The subnet mask/CIDR prefix determines the network and host portions.

Private IPv4 ranges (RFC 1918):
10.0.0.0/8       → 10.0.0.0 – 10.255.255.255
172.16.0.0/12    → 172.16.0.0 – 172.31.255.255
192.168.0.0/16   → 192.168.0.0 – 192.168.255.255

CIDR: /24 means 24 network bits and 8 host bits.
Usable hosts = 2^(32 - prefix) - 2
Example: 192.168.1.0/24 → 2^8 - 2 = 254 usable hosts.

Commands:
ip addr → Shows network interfaces, IP addresses, subnet prefixes and interface status.
ip route → Shows the routing table, default gateway and available routes.

What does an IP address tell us?
An IP identifies a network interface/address and allows packets to be routed. A public IP may reveal approximate information such as country, ISP or organization, but it does not directly reveal someone's identity, exact location or operating system.

Why are IP addresses common in hacker movies?
An IP represents a network endpoint where services such as HTTP, SSH or VPN may be accessible. Movies simplify this heavily: knowing an IP does not automatically identify a person or computer.

Docker and private IPs:
172.16.0.0/12 is NOT reserved for Docker. Docker often uses private ranges such as 172.17.0.0/16, but other systems can use them too. Having an IP such as 172.17.0.2 does not make a machine a Docker container.

Interface names:
eth0, enp0s3, etc. are only interface names/identifiers. Changing the name does not change the real nature of the interface.

Useful commands:
ip addr show → IP and interface information.
ip link show → Interface information and status.
ethtool enp0s3 → Information about an Ethernet interface.

Key idea:
An IP address tells you WHERE network traffic can be sent, not WHO or WHAT the machine really is.
