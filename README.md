API Laravel de produtos

- Clonar o repositório, descompactando em um local de sua preferência: 
- Modificar o .env com as configurações do banco de dados MySQL.
- Necessário ambiente com php e composer.
- Acessar o diretório da aplicação via terminal, rodar os comandos:

composer install
php artisan migrate:fresh
php artisan db:seed
php artisan serve

- Esses comandos criam as tabelas necessárias da API, populam a tabela Products com produtos exemplos.
- Nesse momento a API vai estar respondendo na porta 8000 (http://ip_da_aplicação:8000)
- Também é possível gerar um imagem via docker, onde está encapsulado a aplicação Laravel e o Servidor MySQL, acesse o diretório da aplicação via terminal:

docker-compose build
docker-compose up
docker-compose exec app php artisan migrate:fresh
docker-compose exec app php artisan db:seed

Documentação da API Laravel de Carrinho de Compras

- A API de Carrinho de Compras permite que os usuários visualizem os produtos disponíveis e efetuem compras, adicionando itens ao carrinho e finalizando a compra.

Produtos
Lista de Produtos - Retorna uma lista de todos os produtos disponíveis.

URL: /cart/products

Método: GET

Resposta de sucesso exemplo:
```json
[
    {
        "id": 1,
        "created_at": "2023-03-21T12:46:04.000000Z",
        "updated_at": "2023-03-21T12:46:04.000000Z",
        "title": "Produto 1",
        "price": "10.00"
    },
    {
        "id": 2,
        "created_at": "2023-03-21T12:46:04.000000Z",
        "updated_at": "2023-03-21T12:46:04.000000Z",
        "title": "Produto 2",
        "price": "20.00"
    }
]
```


URL: /cart/checkout 

Método: POST

Envia uma solicitação de checkout para concluir uma compra. Recebe como parâmetro um objeto JSON contendo um array de itens no formato:

```json
{
    "items": [
        {
            "id": 1,
            "title": "Produto 1",
            "price": 10.5,
            "quantity": 2
        },
        {
            "id": 2,
            "title": "Produto 2",
            "price": 15.0,
            "quantity": 3
        }
    ]
}
```

Onde cada objeto do array representa um item a ser comprado, contendo as seguintes propriedades:

id (inteiro): ID do produto.
title (string): título do produto.
price (float): preço unitário do produto.
quantity (inteiro): quantidade de itens do produto a ser comprado.

Respostas possíveis:

- 200 OK: o pedido foi concluída com sucesso.

- 400 Bad Request: ocorreu um erro na solicitação


Front-End Vue.js

- Clonar o repositório, descompactando em um local de sua preferência: 
- Acessar esse diretório via terminal:

npm install
npm run serve

- Nesse momento a aplicação estará respondendo na porta 8080 (http://ip_da_aplicação:8080), podendo ser acessada via navegador web.
- Os produtos para escolha exibia na página Web acessível via navegador só aparecerão caso a API Laravel disponível em esteja rodando na porta 8000.

Também é possível gerar uma imagem Docker via terminal no diretório com o comando:

docker build -t carrinhomaster .

Licença
Este projeto está licenciado sob a licença Creative Commons Attribution 4.0 International.
