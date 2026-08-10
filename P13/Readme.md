## Nginx – Quick Summary

### Commands

`nginx -t` → Tests the Nginx configuration syntax before applying changes.

```bash
sudo nginx -t
```

`service nginx status` → Checks whether Nginx is running.

```bash
sudo service nginx status
```

`service nginx reload` → Reloads the Nginx configuration without stopping the server.

```bash
sudo service nginx reload
```

`ln -s` → Creates a symbolic link, commonly used to enable Nginx sites.

```bash
sudo ln -s /etc/nginx/sites-available/devops-lab /etc/nginx/sites-enabled/devops-lab
```

### Key Concepts

**Nginx as a web server:** Nginx listens for HTTP requests on a specific port and serves files from a configured `root` directory.

```nginx
listen 8080;
root /path/to/html;
```

**Server Block (Virtual Host):** A `server {}` block defines how Nginx handles requests for a website, including the port, domain, root directory, and routing rules.

**sites-available vs sites-enabled:**

* `sites-available/` → Stores available website configurations.
* `sites-enabled/` → Stores symbolic links to the configurations that are active.
* `ln -s` → Creates the link that enables a site.

**Why `nginx -t` before reload?** It checks for configuration errors before applying changes, preventing a bad configuration from breaking the Nginx service.

### Recommended workflow

```bash
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl status nginx
```

