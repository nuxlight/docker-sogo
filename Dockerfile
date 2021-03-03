FROM oraclelinux:8

# S6 Apply
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

# Enable EPEL
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install SoGo
ADD config/SOGo.repo /etc/yum.repos.d/SOGo.repo 
RUN dnf install -y sogo --nogpgcheck

# Install temlater for config file
RUN curl -L https://raw.githubusercontent.com/johanhaleby/bash-templater/master/templater.sh -o /usr/local/bin/templater
RUN chmod +x /usr/local/bin/templater

# Add SoGo config
ADD config/sogo.conf /etc/sogo/sogo.conf

ADD root /

EXPOSE 20000

ENTRYPOINT ["/init"]
