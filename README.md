# Inception
Simple webstack, orchestrated by docker compose.

## TODO:
- [X] setup secrets
- [X] setup .env
- [ ]

### NGINX:
- [x] setup nginx
- [x] Self signed ssl certificates
- [x] Https 443 only

### WordPress:
- [X] SetUp php-fpm with nginx
- [X] Install WordPress
- [X] Add two users
- [X] Connect with official mariaDB image
- [ ] Restrict wordpress admin user name (Must not contain 'admin')
- [ ] Connect with custom mariaDB image

### MariaDB:
- [ ] Install, create, configure
- [ ] ?

### Docker Network:
- [X] Create a network, not host, no --links.
- [ ] Setup the host name

