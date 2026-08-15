**Forward Proxy vs. Reverse Proxy Architecture**

* **Forward Proxy:** Sits between client devices and the internet. It acts on behalf of clients (e.g., corporate web filters or VPNs) to fetch external resources, hiding the clients' identities from destination servers.
* **Reverse Proxy:** Sits in front of backend servers. It acts on behalf of the servers to intercept external client requests and route them to internal services, hiding backend infrastructure from the public internet.

**Key Reverse Proxy Functions**

* **Load Balancing:** Distributes incoming requests across multiple backend instances to maximize throughput, minimize latency, and prevent any single server from overloading.
* **SSL/TLS Termination:** Handles resource-intensive HTTPS decryption at the proxy layer, passing unencrypted HTTP traffic to internal servers to lighten their processing load.
* **Security Isolation:** Acts as a barrier against direct attacks (e.g., DDoS or port scanning) by keeping internal server IP addresses, topology, and internal ports hidden.

**Nginx Proxy Directives**

* **`proxy_pass`:** Defines the target server where requests should be forwarded (e.g., `[http://127.0.0.1:8081](http://127.0.0.1:8081)`).
* **`proxy_set_header Host $host`:** Forwards the original `Host` header requested by the client to the backend server rather than the proxy's IP.
* **`proxy_set_header X-Real-IP $remote_addr`:** Passes the client’s actual IP address directly to the backend application for logging and security checks.
* **`proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for`:** Appends the client IP to an IP chain list, preserving origin data across multiple proxy hops.

**Build & Verification Summary (Port 8080 to 8081)**

1. **Backend Initialization:** Created a simple `index.html` file inside a `backend/` directory and launched Python’s HTTP server in the background listening on internal port 8081 (`python3 -m http.server 8081 --directory backend &`).
2. **Nginx Configuration:** Created a server block listening publicly on port 8080 configured with `proxy_pass [http://127.0.0.1:8081](http://127.0.0.1:8081);` and header-preserving directives.
3. **Activation:** Enabled the configuration via symlink (`/etc/nginx/sites-enabled/`), tested syntax with `sudo nginx -t`, and reloaded Nginx.
4. **Verification & Troubleshooting:** Executed `curl http://localhost:8080`. Encountered a **502 Bad Gateway** due to an inactive background Python process, which was resolved by confirming the backend status on port 8081 before successfully fetching the routed payload via port 8080.
