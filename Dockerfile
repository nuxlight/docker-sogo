FROM oraclelinux:8

# S6 Apply
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

# Enable EPEL
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install SoGo
ADD config/SOGo.repo /etc/yum.repos.d/SOGo.repo 
RUN dnf install -y sogo ansible --nogpgcheck

# Add SoGo config template
ADD config/sogo.conf.j2 /etc/sogo/sogo.conf.j2

ADD root /

EXPOSE 20000

ENTRYPOINT ["/init"]
