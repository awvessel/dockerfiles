FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

# Maintain our own PostgreSQL user and group
RUN /usr/sbin/groupadd -r -g 200 postgres
RUN /usr/sbin/useradd -M -r -u 200 -g postgres postgres -d /var/lib/postgresql

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get -y -q install postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 \
                          postgresql-server-dev-9.4 \
                          postgresql-9.4-plv8 postgresql-plpython-9.4 postgresql-plperl-9.4 \
                          postgresql-9.4-plproxy

# Clean up apt-leftovers
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# Adjust PostgreSQL configuration so that remote connections to the database are possible.
RUN echo "host    all    all         0.0.0.0/0  trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN sed -i -e "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.4/main/postgresql.conf

# Remove the external pidfile reference in the config
RUN /bin/sed -i 's/external_pid_file =/#external_pid_file =/' /etc/postgresql/9.4/main/postgresql.conf

ADD etc/consul.d/postgresql.json /etc/consul.d/
ADD etc/supervisor.d/postgresql.conf /etc/supervisor.d/

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME	["/etc/postgresql", "/var/log/postgresql"]
