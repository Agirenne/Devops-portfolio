NETWORKING, FIREWALLS & BASIC CYBERSECURITY – QUICK SUMMARY

Ports:
A port identifies a specific network service on a machine.
IP address = which machine/interface
Port = which service

Well-known/common ports:
22   → SSH
80   → HTTP
443  → HTTPS

Custom/application ports:
8080 → often used for alternative web servers or development
3306 → MySQL
A service can technically use any available port; these are conventions, not strict requirements.

Checking active services:
ss -tulpn
→ Shows TCP/UDP sockets, listening ports, and the processes using them.
LISTEN = a service is waiting for connections.
ESTAB = a TCP connection is currently established.
127.0.0.1 = accessible only locally.
0.0.0.0 = listening on all IPv4 interfaces.
[::] = listening on IPv6 interfaces.

Firewall / UFW:
ufw = Uncomplicated Firewall, a high-level interface for managing Linux firewall rules.

ufw status
→ Shows whether UFW is active and displays its rules.

ufw status numbered
→ Displays firewall rules with numbers.

ufw default deny incoming
→ Denies incoming connections by default.

ufw default allow outgoing
→ Allows outgoing connections by default.

ufw allow 8080/tcp
→ Allows incoming TCP connections on port 8080.

ufw deny 8080/tcp
→ Blocks incoming TCP connections on port 8080.

Default Deny:
A secure firewall model is:
DENY incoming traffic by default → explicitly allow only required services.
This reduces the attack surface.

Example:
22   → ALLOW (SSH)
80   → ALLOW (HTTP)
443  → ALLOW (HTTPS)
8080 → DENY unless needed

UFW vs iptables:
UFW is a high-level, easier-to-use firewall management tool.
iptables is a lower-level interface used to configure packet-filtering rules in the Linux networking stack.
UFW simplifies firewall management, while iptables provides more detailed control.

iptables -L -n
→ Lists current iptables rules without resolving IP addresses or service names.
(-L = list, -n = numeric output)

Important cybersecurity concepts:
A listening port does NOT automatically mean someone is connected.
LISTEN → a service is waiting for connections.
ESTAB → an active TCP connection exists.

ss -tunap
→ Can be used to inspect active TCP/UDP connections and the processes using them.

Firewall ≠ malware protection:
A firewall can block unwanted network connections, but it cannot guarantee that a machine is not infected.
For example, an infected machine may initiate an outgoing connection.

Default:
Incoming → DENY by default
Outgoing → ALLOW by default

A firewall can reduce the impact of a compromise by limiting accessible services, but it does not detect or remove malware by itself.

Security troubleshooting:
1. Check whether the service is running:
   systemctl status nginx

2. Check whether the service is listening:
   ss -tulpn

3. Check whether the firewall allows the port:
   ufw status numbered

4. Check active connections:
   ss -tunap

5. Check authentication/system logs:
   journalctl
   /var/log/auth.log

Key security principle:
Minimize the attack surface: only expose the ports and services that are actually required.
