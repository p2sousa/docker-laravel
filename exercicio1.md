### Modulo DevOps - Docker

#### Projeto pratico 1

Configure um ambiente de desenvolvimento com Laravel utilizando:

- Nginx.
- PHP-FPM.
- Redis.
- Mysql.

## Etapa 1 com docker-compose

Para executar o projeto clone esse repositorio e em seguida rode:
```
$ docker-compose up -d
```

Obs:. Ao rodar o `docker-composer up -d` o container
 `app` ira automaticamente rodar o 
 `composer install`, 
 `php artisan key:generate`, 
 `php artisan migrate`.

depois verifique se os containers subiram:

```
$ docker-compose ps
```

O projeto estará rodando em: [http://localhost:8000/](http://localhost:8000/).

## Etapa 2 com DockerHub

Foram geradas imagens dos container, que estão disponiceis em: 

- **[DockerHub/p2sousa/laravel-app](https://hub.docker.com/r/p2sousa/laravel-app)**
