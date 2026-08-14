TCP, UDP, DNS & SSH – Quick Summary

TCP vs UDP:
TCP (Transmission Control Protocol) is connection-oriented, reliable, and ensures data arrives in the correct order. It is commonly used for HTTP/HTTPS, SSH, etc.
UDP (User Datagram Protocol) is connectionless, faster, and does not guarantee delivery or order. It is commonly used for DNS, streaming, VoIP, and online gaming.

DNS Resolution:
/etc/hosts → Local hostname-to-IP mappings. These can be checked before querying external DNS servers.
 /etc/resolv.conf → Defines the DNS resolvers that the system can query when a local hostname is not resolved locally.
Example:
127.0.0.1 localhost
192.168.1.10 myserver

dig:
Used to troubleshoot and inspect DNS queries.
Example:
dig example.com
dig @8.8.8.8 example.com
It shows the DNS response, records, server used, and query information.

nslookup:
A simpler command for querying DNS records.
Example:
nslookup example.com

SSH Keys:
SSH uses asymmetric cryptography with a key pair:
Private key → Kept secret on your computer. Never share it.
Public key → Can be safely copied to the remote server.

The public key is stored on the server, usually in:
~/.ssh/authorized_keys

When connecting:
ssh user@server
SSH uses the key pair to authenticate you without sending your private key to the server.

ssh-keygen:
Creates an SSH key pair.
Example:
ssh-keygen -t ed25519

ssh:
Used to securely connect to a remote machine.
Example:
ssh user@192.168.1.10

Key idea:
TCP = reliable connection
UDP = fast connectionless communication
/etc/hosts = local hostname resolution
/etc/resolv.conf = DNS resolver configuration
dig/nslookup = DNS troubleshooting
Private key = secret
Public key = shareable
ssh = secure remote connection
