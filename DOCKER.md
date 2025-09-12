# Docker usage
For old system that doesn't have php8.1 or its extensions it's possible to use interpreter inside docker.

## Requirements
It's mandatory to have docker and docker-compose installed in your system.

## Create the image
First create the php docker image with all enabled extensions and xdebug enable.
```bash
$ docker compose build
```

## Run console inside docker
Running bash inside docker container
```bash
$ docker compose run --remove-orphans php81
```
Then you can start the php built-in webserver
```
$ php -S 0.0.0.0:8000 -t public/
```
Environment variable like SIMPLESAMLPHP_CONFIG_DIR are already setup.
Xdebug listen for connection on port 9003.
