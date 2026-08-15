NETWORK TROUBLESHOOTING – KEY CONCEPTS

• OSI Layer Approach:
  Layer 3 (Network) → IP connectivity and routing: ping, tracepath.
  Layer 4 (Transport) → TCP/UDP ports and connections: nc, ss.
  Layer 7 (Application) → DNS, HTTP/HTTPS and application services: dig, curl.

• ping:
  Uses ICMP Echo Request/Reply to test basic network connectivity and measure latency.

• tracepath / traceroute:
  Shows the path packets take through the network. They use TTL to identify network hops and can help locate routing or path problems.

• dig +short:
  Performs DNS resolution and displays the IP address(es) associated with a domain in a simplified format.

• ss -tulpn:
  Displays active/listening TCP and UDP sockets, including ports, IP addresses and associated processes.

• nc -zv (Netcat):
  Quickly checks whether a TCP/UDP port is reachable. -z = scan mode, -v = verbose output.

• curl -I:
  Tests HTTP/HTTPS connectivity and displays response headers.

• Automated Diagnostic Reports:
  Multiple commands can be combined using { ... }, pipes (|), and output redirection (>) to automatically generate a network diagnostic report.

KEY IDEA:
Troubleshoot from lower to higher layers:
IP connectivity → Routing → Ports → DNS → HTTP/HTTPS → Application.
