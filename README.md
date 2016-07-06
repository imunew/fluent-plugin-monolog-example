# monolog-fluentd-example

## Setup docker

### VirtualBox
Download installer and install.<br>
https://www.virtualbox.org/wiki/Downloads

### Docker toolbox
Download installer and install.<br>
https://www.docker.com/products/docker-toolbox

The following components are installed.
- Docker Engine
- Compose
- Machine
- Kitematic

## How to use
### Starting docker-machine
```
$ docker-machine start default
```
### Setting environment variables
```
$ docker-machine env default
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/path/to/home/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval $(docker-machine env default)
```

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
