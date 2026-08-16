**Multi-Tier Network Topologies in Cloud Environments**

* **Public Tier (Edge):** Holds internet-facing resource entry points like Load Balancers or Reverse Proxies in public subnets with direct Internet Gateway access.
* **Application Tier (Private):** Houses core business logic and microservices in private subnets, blocking direct inbound internet access while maintaining outbound access via NAT Gateways.
* **Database Tier (Isolated):** Isolates data storage in fully restricted subnets that only accept inbound connections from authorized application instances.

**Path-Based Routing with Reverse Proxies**

* An edge gateway (e.g., Nginx) intercepts incoming HTTP requests on a single domain/port and inspects the URL path.
* Using directive rules (like Nginx `location` blocks), it maps requested paths (`/api/v1/` vs. `/api/v2/`) to distinct internal upstream microservices or ports (e.g., routing `/api/v1` to port 8081 and `/api/v2` to port 8082).
* Backend service changes and version upgrades remain completely transparent to public clients.

**Phase 2 Key Takeaways: Networking & Routing Protocols**

* **IP Subnetting:** CIDR notation defines network scope, segmenting cloud networks to segregate environments and minimize attack surfaces.
* **Core Protocols:** TCP guarantees ordered packet delivery, UDP offers low-latency connectionless transport, DNS translates domain names to IPs, and HTTP/S handles web application traffic.
* **HTTPS/TLS:** Secures data in transit using TLS encryption, providing secrecy, integrity, and server authentication via public key certificates.
* **Firewalls & Security Groups:** Filter inbound and outbound traffic at subnet levels (stateless NACLs) and instance levels (stateful Security Groups).
* **Troubleshooting Tools:** Commands like `ping`, `netstat`/`ss`, `curl`, `traceroute`, and `dig` isolate network layer failures, port availability, and DNS resolution issues.
* **Inbound Routing:** Controls how external traffic navigates through internet gateways, routing tables, and load balancers to reach backend services.

**Command Utilities**

* **`python3 -m http.server [port]`:** Launches Python's built-in, single-threaded HTTP web server to serve static files directly from a local directory (useful for rapid backend prototyping).
* **`curl -s [URL]`:** Fetches HTTP response data silently, hiding progress bars and error output to keep automated logs clean.
* **`ssh -i /path/to/key.pem user@host`:** Initiates an SSH session using a specific private key file for authentication instead of relying on standard password prompts.
* **`nginx -t`:** Validates Nginx configuration files for syntax errors or misconfigurations without modifying or interrupting the live running service
