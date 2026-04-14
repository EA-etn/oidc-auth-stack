# 🔐 OIDC Authentication (Keycloak + OAuth2 Proxy + Caddy)

## 📌 Overview

This project is a Proof of Concept (PoC) that demonstrates an authentication flow using OpenID Connect (OIDC).

It's designed to understand how modern authentication architectures work before moving into production environments.

---

## 🧱 Architecture

![alt text](/architecture/image.png)

---

## 🛠️ Tech Stack

- **Keycloak** → Identity Provider (IdP)
- **OAuth2 Proxy** → Authentication layer
- **Caddy** → Reverse proxy
- **Whoami** → Test protected service
- **Docker Compose** → Container orchestration

---

## 🔄 Authentication Flow

1. User accesses the application
2. OAuth2 Proxy detects no session
3. User is redirected to Keycloak
4. User authenticates
5. Keycloak returns an authorization code
6. OAuth2 Proxy validates the token
7. Access is granted to the protected service

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USER/auth-lab-keycloak-oauth2-proxy.git
cd auth-lab-keycloak-oauth2-proxy
```
### 2. Create .env file
```bash
cp .env.example .env
```
Edit values:
```env
KEYCLOAK_ADMIN=user_admin
KEYCLOAK_ADMIN_PASSWORD=your_admin_password
HOST_IP=your_server_local_ip
OAUTH2_PROXY_CLIENT_SECRET=your_secret
OAUTH2_PROXY_COOKIE_SECRET=your_base64_secret
USERNAME=name_test_user
PASSWORD=password_test_user
```
### 3. Start script
Grants permission
```bash
chmod +x generate-config.sh
```
Run script
```bash
./generate-config.sh
```
### 4. Start services
```bash
docker compose up -d
```
Wait until the 4-minute OAuth2 startup is complete before starting Keycloak
### 5. Access the application
Open your browser and enter your server's IP address and port
```bash
http://<YOUR_IP>:8088
```
Log in using the test credentials. For example:
```bash
Username: testuser
Password: test1234
```
---
### ⚠️ Notes
---
This project is intended for local/lab environments
It uses HTTP (no HTTPS)
It relies on IP addresses instead of domains
Not production-ready

---
### 📈 Roadmap
---
- Version 1: IP + HTTP (current)
- Version 2: Local domains (auth.local / app.local)

---
### 🎯 Purpose
---
This lab demonstrates:

- OpenID Connect (OIDC) authentication
- Identity Provider integration (Keycloak)
- Reverse proxy patterns
- Decoupled authentication architecture

---
### 📄 License
---
This project is licensed under the MIT License