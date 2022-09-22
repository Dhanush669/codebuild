## Dockerized Nodejs Application



## Getting started

1. Build the Docker image

```
docker build -t custom-nodejs/mysql .

```

2. Update the build image name in docker-compose.yml

3. start the docker container 

```
docker-compose up -d

```

4. You can check database connection with this below format

```
http://IP:PORT/getMysqlStatus

```


