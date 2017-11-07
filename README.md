# fluent-plugin-monolog-example
This is the example for [fluent-plugin-monolog](https://rubygems.org/gems/fluent-plugin-monolog).

## Setup docker
### For Mac
Download and install [Docker Community Edition for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac).

> When the installation completes and Docker starts, the whale in the top status bar shows that Docker is running, and accessible from a terminal.

## How to use
### Building docker
```
$ docker build -t monolog-fluentd-example .
```

### Running docker
```
$ docker run -v $(pwd):/data -it monolog-fluentd-example
Starting td-agent:                                         [  OK  ]
[root@3df672832b5d data]#
```

### Install packages via composer
```
[root@c8a9b3790abe data]# composer install
Loading composer repositories with package information
Installing dependencies (including require-dev) from lock file
  - Installing psr/log (1.0.0)
    Downloading: 100%

  - Installing monolog/monolog (1.19.0)
    Downloading: 100%

  - Installing fluent/logger (v0.3.8)
    Downloading: 100%

  - Installing dakatsuka/monolog-fluent-handler (1.2.0)
    Downloading: 100%

monolog/monolog suggests installing aws/aws-sdk-php (Allow sending log messages to AWS services like DynamoDB)
monolog/monolog suggests installing doctrine/couchdb (Allow sending log messages to a CouchDB server)
monolog/monolog suggests installing ext-amqp (Allow sending log messages to an AMQP server (1.0+ required))
monolog/monolog suggests installing ext-mongo (Allow sending log messages to a MongoDB server)
monolog/monolog suggests installing graylog2/gelf-php (Allow sending log messages to a GrayLog2 server)
monolog/monolog suggests installing mongodb/mongodb (Allow sending log messages to a MongoDB server via PHP Driver)
monolog/monolog suggests installing php-amqplib/php-amqplib (Allow sending log messages to an AMQP server using php-amqplib)
monolog/monolog suggests installing php-console/php-console (Allow sending log messages to Google Chrome)
monolog/monolog suggests installing raven/raven (Allow sending log messages to a Sentry server)
monolog/monolog suggests installing rollbar/rollbar (Allow sending log messages to Rollbar)
monolog/monolog suggests installing ruflin/elastica (Allow sending log messages to an Elastic Search server)
Generating autoload files
```

### Executing examples
Executing `example/fluent_handler.php`

```bash
[root@3df672832b5d data]# php example/fluent_handler.php
```

Waiting about 30 seconds.

```bash
[root@3df672832b5d data]# sqlite3 /var/db/td-agent/example.sqlite3 "select * from log;"
1|DEBUG|foo bar|fluent|2016-07-06 18:59:09
```

Executing `example/stream_handler.php`

```bash
[root@3df672832b5d data]# php example/stream_handler.php
```

Waiting about 30 seconds.

```bash
[root@3df672832b5d data]# sqlite3 /var/db/td-agent/example.sqlite3 "select * from log;"
1|DEBUG|foo bar|fluent|2016-07-06 18:59:09
2|DEBUG|foo bar|stream|2016-07-06 19:02:28
```
