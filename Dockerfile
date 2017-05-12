FROM centos:6.6

# Setting timezone
RUN yum -y groupinstall "Japanese Support"
RUN rm -f /etc/localtime &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY ./config/sysconfig/clock /etc/sysconfig/clock

# Install EPEL Repository
RUN yum -y install epel-release

# Install td-agent
RUN yum install -y sudo gcc rubygems
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh

# Install fluent-plugin-sqlite3
RUN yum install -y sqlite-devel
RUN td-agent-gem install fluent-plugin-sqlite3

# Install fluent-plugin-parser
RUN td-agent-gem install fluent-plugin-parser

# Install fluent-plugin-monolog
RUN td-agent-gem install fluent-plugin-monolog

# Install Remi Repository
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Install PHP
RUN yum install -y --enablerepo=remi-php56,remi \
    php php-devel php-common

# Install composer
RUN cd /tmp &&\
    curl -sS https://getcomposer.org/installer | php &&\
    mv ./composer.phar /usr/local/bin/composer

RUN mkdir -p /data
WORKDIR /data

# Configurations
COPY ./config/fluentd/td-agent.conf /etc/td-agent/td-agent.conf

# Create sqlite3 database
COPY ./db/create_tables.sql /tmp/create_tables.sql
RUN mkdir -p /var/db/td-agent
RUN sqlite3 /var/db/td-agent/example.sqlite3 < /tmp/create_tables.sql
RUN chown -R td-agent:td-agent /var/db/td-agent

# Setting environment variables
ENV TZ Asia/Tokyo
ENV LANGUAGE ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8

ENTRYPOINT service td-agent start && /bin/bash
