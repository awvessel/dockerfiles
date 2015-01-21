#
# Base docker image for Ubuntu that sets up
#
FROM ubuntu:trusty
MAINTAINER gavinr@aweber.com

# Let aptitude know it's a non-interactive install
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN rm /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
RUN dpkg-divert --local --rename --add /sbin/initctl

# Don't let upstart start installed services
ADD usr/sbin/policy-rc.d /usr/sbin/policy-rc.d
RUN /bin/chmod 755 /usr/sbin/policy-rc.d

# Install dependencies
RUN apt-get update
RUN apt-get install -y -q  curl rsyslog supervisor unzip

RUN rm -f /etc/cron.daily/standard

# Install consul
RUN curl -o /tmp/consul.zip -L https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip
RUN unzip /tmp/consul.zip -d /tmp/
RUN chmod +x /tmp/consul
RUN mv /tmp/consul /usr/local/bin/consul
RUN rm /tmp/consul.zip
RUN mkdir -p /etc/consul.d

# Remove the no longer required unzip
RUN apt-get -qq -y remove curl unzip

# Clean up apt-leftovers
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# Remove auto-installed cron jobs
RUN rm /etc/cron.daily/apt \
       /etc/cron.daily/dpkg \
       /etc/cron.daily/passwd \
       /etc/cron.daily/upstart \
       /etc/cron.weekly/fstrim

# Configuration files
ADD etc/consul.d/consul.json /etc/consul.d/consul.json
ADD etc/security/limits.conf /etc/security/limits.conf
ADD etc/supervisord.conf /etc/supervisord.conf
ADD etc/supervisor.d/consul.conf /etc/supervisor.d/consul.conf
ADD etc/supervisor.d/rsyslog.conf /etc/supervisor.d/rsyslog.conf
ADD etc/sysctl.conf /etc/sysctl.conf

# For consul
ENV GOMAXPROCS 10

# Run Supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
