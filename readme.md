## Treinamento Microserviços

### Modulo DevOps - Docker

#### Projeto pratico 1

Configure um ambiente de desenvolvimento com Laravel utilizando:

- Nginx.
- PHP-FPM.
- Redis.
- Redis

## Entrega

## Ambiente de desenvolvimento com docker-compose

Para executar o projeto clone esse repositorio e em seguida rode:
```
$ docker-compose up -d
```
depois verifique se os containers subiram:

```
$ docker-compose ps
```

depois entre no container app e rode o `composer install` e `php artisan migrate`:

```
$ docker exec -it app bash
$ composer install
$ php artisan migrate
```

O projeto estará rodando em: [http://localhost:8000/](http://localhost:8000/).

## Ambiente de produçao com DockerHub

Foram geradas imagens dos container, que estão disponiceis em: 

- **[app](https://hub.docker.com/r/p2sousa/laravel-app)**
