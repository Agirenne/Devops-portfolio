HTTP, HTTPS & Diagnostics – Quick Summary

HTTP Methods:
GET → Retrieves data from a server.
POST → Sends data to the server, usually to create or submit something.
PUT → Creates or completely updates a resource.
DELETE → Deletes a resource.
HEAD → Same as GET but returns only the HTTP headers, not the response body.

HTTP Status Codes:
2xx → Success
200 OK → Request successful.
201 Created → Resource successfully created.

3xx → Redirection
301 Moved Permanently → Resource has a new permanent URL.
302 Found → Temporary redirection.

4xx → Client Error
400 Bad Request → Invalid request.
401 Unauthorized → Authentication is required.
403 Forbidden → Server understood the request but refuses access.
404 Not Found → Requested resource does not exist.

5xx → Server Error
500 Internal Server Error → Server encountered an unexpected error.
502 Bad Gateway → Server received an invalid response from another server.
503 Service Unavailable → Server is temporarily unavailable.

SSL/TLS Handshake:
The TLS handshake establishes a secure HTTPS connection between the client and server.
1. Client and server negotiate TLS parameters.
2. The server provides its certificate.
3. The certificate is verified.
4. Both sides establish shared encryption keys.
5. Encrypted HTTPS communication begins.

curl:
Used to send HTTP requests and test web servers.

curl -H → Adds a custom HTTP header.
Example:
curl -H "Content-Type: application/json" http://localhost:8080

curl -X → Specifies the HTTP method.
Example:
curl -X POST http://localhost:8080

curl -I → Sends a HEAD request and displays HTTP headers.
(Note: if your notes say curl -<, this is probably curl -I.)

curl -p → Not a standard option for basic HTTP diagnostics; check the specific command/context in your lab.

openssl s_client:
Used to inspect and troubleshoot SSL/TLS connections and certificates.
Example:
openssl s_client -connect example.com:443

Key idea:
curl → Tests HTTP/HTTPS requests and server responses.
openssl s_client → Inspects the TLS connection and certificate.
