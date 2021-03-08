FROM oraclelinux:8

# S6 Apply
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

# Enable EPEL
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install SoGo
ADD config/SOGo.repo /etc/yum.repos.d/SOGo.repo 
RUN dnf install -y sogo ansible nginx sope49-gdl1-mysql mysql mariadb-devel nc --nogpgcheck

# Add SoGo config template
ADD config/sogo.conf.j2 /etc/sogo/sogo.conf.j2
# Add Nginx config template
ADD config/nginx.conf.j2 /etc/nginx/nginx.conf.j2
# Add Nginx config template
ADD config/auth_sogo.sql.j2 /tmp/auth_sogo.sql.j2

ADD root /

EXPOSE 80

ENTRYPOINT ["/init"]
