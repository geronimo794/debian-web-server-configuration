# Debian Web Server Configuration
## 1. Application Information
Configuration setup for VPS with Debian operating system
The basic application function we will need for the server is:
1. Basic security
2. Proxy/Webserver
3. Containerization Application
4. CI/CD Pipeline
5. Monitoring

### 1. Basic Security
| Application   |
| ------------- |
| UFW           |
| Let's encrypt |
| Fail2Ban      |

### 2. Proxy/Webserver
| Application   |
| ------------- |
| Nginx         |

### 3. Containerization Application
| Application   |
| ------------- |
| Docker        |

### 4. CI/CD Pipeline
| Application      |
| ---------------- |
| Jenkins(Docker)  |

### 5. Monitoring
| Application               |
| ------------------------- |
| Promotheus(Docker)        |
| Promotheus Node Exporter  |
| Grafana(Docker)           |

## 2. Get's Started
### Basic Security
For the basic security, we will change the SSH Port, disable root login, and disable password login.
```
nano /etc/ssh/sshd_config
```
Change the value
```
...
Port 2000
...
PermitRootLogin no
...
PubkeyAuthentication yes
...
PasswordAuthentication no
...
```
- #### UFW
  1. Install UFW(Example tutorial: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-debian-11-243261243130246d443771547031794d72784e6b36656d4a326e49732e)
  1. Deny all incoming, allow all outgoing.
  ```
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  ```
  2. Allow ssh port 2000, http and https
  ```
  sudo ufw allow 2000
  sudo ufw allow http
  sudo ufw allow https
  ```
  3. Enable UFW
  ```
  sudo ufw enable
  ```
  4. Check UFW Status
  ```
  sudo ufw status verbose
  ```
- #### Let's encrypt
- #### Fail2Ban
.
### Proxy/Webserver
#### Nginx
.
### Containerization Application
#### Docker
.
### CI/CD Pipeline
#### Jenkins(Docker)
.
### Monitoring
#### Promotheus Node Exporter
#### Promotheus(Docker)
#### Grafana(Docker)
.
