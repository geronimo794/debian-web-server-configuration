# Debian Web Server Configuration[ON GOING]
## 1. Application Information
Configuration setup for VPS with Debian operating system
The basic application function we will need for the server is:
1. Proxy/Webserver
2. Basic security
3. Containerization Application
4. CI/CD Pipeline
5. Monitoring

### 1. Proxy/Webserver
| Application   |
| ------------- |
| Nginx         |

### 2. Basic Security
| Application   |
| ------------- |
| UFW           |
| Let's encrypt |
| Fail2Ban      |

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

## 2. Auto Installation Script
Make sure you have fresh installation of debian distribution
```
sudo apt update
sudo apt install git -y
git clone https://github.com/geronimo794/debian-web-server-configuration.git
cd debian-web-server-configuration
sudo chmod +x install.sh
./install.sh
```
