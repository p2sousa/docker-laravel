## Treinamento Microserviços

### Modulo DevOps - Docker

#### Projeto pratico 1

Configure um ambiente de desenvolvimento com Laravel utilizando:

- Nginx.
- PHP-FPM.
- Redis.
- Redis

## Entrega

### Docker-compose

Para executar o projeto clone esse repositorio e em seguida rode:
```
$ docker-compose up -d
```
depois verifique se os containers subiram:

```
$ docker-compose ps
```

O projeto estará rodando em: [http://localhost:8000/](http://localhost:8000/).

## DockerHub

Foram geradas imagens dos container, que estão disponiceis em: 

- **[app](https://hub.docker.com/r/p2sousa/laravel-app)**
- **[nginx](https://hub.docker.com/r/p2sousa/laravel-nginx)**
- **[db](https://hub.docker.com/r/p2sousa/laravel-db)**
- **[redis](https://hub.docker.com/r/p2sousa/laravel-redis)**
