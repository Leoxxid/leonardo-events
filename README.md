# Leonardo Events

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/)


## Índice

- [Pré requisitos](#pré-requisitos)
- [Primeiros passos](#primeiros-passos)
- [Testes](#testes)




### Pré requisitos

É preciso ter instalado em sua máquina:

- Docker
- Docker Compose



## Primeiros passos

Siga as seguintes instruções para ter uma cópia deste projeto e conseguir executá-lo localmente.

Depois de copiar o repositório para sua máquina, acesse o diretório raiz do projeto e:

1.  Construa o container

```
docker-compose build
```

2.  Instale as dependências

```
docker-compose run --rm app bundle 
```



2.  Crie o banco de dados e execute as migrations

```
docker-compose run --rm app bundle exec rails db:create db:migrate
```

3.  Suba o projeto

```
docker-compose up
```


# Testes

1. Para rodar os testes utilizando o rspec execute o seguinte comando

   ```
   docker-compose run --rm app bundle exec rspec
   ```

2. Para testar a aplicação utilizando o postman, faça a importação desta [collection](leonardo-events.json) 