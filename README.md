# nginx-nodejs-redis-docker-compose

# 🚀 Docker Compose of a Node.js application with Nginx proxy and Redis database 🚀

https://github.com/coding-to-music/nginx-nodejs-redis-docker-compose

From / By https://github.com/ajeetraina/awesome-compose/tree/master/nginx-nodejs-redis

https://github.com/ajeetraina/awesome-compose


## Environment variables:

```java

```

## user interfaces:

- Consul http://localhost:8500
- Fake Service http://localhost:9090/ui
- Prometheus http://localhost:9092/targets
- Node exporter metrics http://localhost:9100/metrics
- Grafana Tempo http://localhost:3000/explore
- Grafana Dashboards http://localhost:3000/dashboards
- Grafana Datasources http://localhost:3000/datasources

## GitHub

```java
git init
git add .
git remote remove origin
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:coding-to-music/nginx-nodejs-redis-docker-compose.git
git push -u origin main
```

## Compose sample application

## Node.js application with Nginx proxy and Redis database

Project structure:
```
.
├── README.md
├── compose.yaml
├── nginx
│   ├── Dockerfile
│   └── nginx.conf
└── web
    ├── Dockerfile
    ├── package.json
    └── server.js

2 directories, 7 files


```
[_compose.yaml_](compose.yaml)
```
redis:
    image: 'redislabs/redismod'
    ports:
      - '6379:6379'
  web1:
    restart: on-failure
    build: ./web
    hostname: web1
    ports:
      - '81:5000'
  web2:
    restart: on-failure
    build: ./web
    hostname: web2
    ports:
      - '82:5000'
  nginx:
    build: ./nginx
    ports:
    - '80:80'
    depends_on:
    - web1
    - web2
```
The compose file defines an application with four services `redis`, `nginx`, `web1` and `web2`.
When deploying the application, docker compose maps port 80 of the nginx service container to port 80 of the host as specified in the file.


> ℹ️ **_INFO_**  
> Redis runs on port 6379 by default. Make sure port 6379 on the host is not being used by another container, otherwise the port should be changed.

## Deploy with docker compose

```
$ docker compose up -d
[+] Running 24/24
 ⠿ redis Pulled                                                                                                                                                                                                                      ...
   ⠿ 565225d89260 Pull complete                                                                                                                                                                                                      
[+] Building 2.4s (22/25)
 => [nginx-nodejs-redis_nginx internal] load build definition from Dockerfile                                                                                                                                                         ...
[+] Running 5/5
 ⠿ Network nginx-nodejs-redis_default    Created                                                                                                                                                                                      
 ⠿ Container nginx-nodejs-redis-web2-1   Started                                                                                                                                                                                      
 ⠿ Container nginx-nodejs-redis-redis-1  Started                                                                                                                                                                                      
 ⠿ Container nginx-nodejs-redis-web1-1   Started                                                                                                                                                                                      
 ⠿ Container nginx-nodejs-redis-nginx-1  Started
```


## Expected result

Listing containers must show three containers running and the port mapping as below:


```
docker-compose ps
```

## Testing the app

After the application starts, navigate to `http://localhost:80` in your web browser or run:

```
curl localhost:80
curl localhost:80

web1: Total number of visits is: 1
```

```
curl localhost:80

web1: Total number of visits is: 2
```
```
curl localhost:80

web2: Total number of visits is: 3
```



## Stop and remove the containers

```
docker compose down
```

