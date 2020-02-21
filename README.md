# README
Sistema que busca e armazena os tweets mas relevantes e recentes, que contenham as hashtags cadastradas no sistema

# Versões
* Ruby 2.6.5
* Rails 6.0.2

# Dependências do Sistema
- yarn
- postgresql
- webpacker

# Rodando os teste
```
RAILS_ENV=test bundle exec rspec spec
```

# Serviços
 - TwitterService(Busca tweets com as hashtags cadastradas no sistema)

# Deploy

Remova os arquivos das credencias
```
rm config/credentials.yml.enc
rm config/master.key
```

Execute o seguinte comando para recriar os arquivos das credencias
rails credentials:edit

Essa aplicação utiliza autenticação via bearer token do twitter, para mais informações de como obtê-lo acesse https://developer.twitter.com/en/docs/basics/authentication/oauth-2-0/bearer-tokens

Adicione essas duas linhas as credenciais
```
api_url: https://api.twitter.com/1.1/search/tweets.json

bearer_access_token: <seu_bearer_token>
```
Instale as gems
```
bundle install
```
Instale as bibliotecas adicionadas com yarn
```
yarn install
```

Crie a base de dados
```
bundle exec rake db:create
```

Execute as migrations
```
bundle exec rake db:migrate
```

Inicie o delayed_job
```
bin/delayed_job start
```

Suba o serviço
```
bundle exec rails s
```