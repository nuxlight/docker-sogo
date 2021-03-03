FROM registry.access.redhat.com/ubi8/ubi

# Enable EPEL
RUN yum install -y --disableplugin=subscription-manager https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install SoGo
#RUN rpm --import 'http://pgp.mit.edu/pks/lookup?op=get&search=0xCB2D3A2AA0030E2C'
RUN tee /etc/yum.repos.d/SOGo.repo <<EOF [sogo] name=SOGo Repository baseurl=https://packages.inverse.ca/SOGo/nightly/5/rhel/8/\$basearch gpgcheck=1 EOF
RUN yum install -y --disableplugin=subscription-manager sogo

