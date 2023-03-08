## Ask_me

[Ask_me](http:/www.ilyaz.site) - сайт, где можно задавать людям вопросы на их публичной страничке.

Работает на `Ruby 3.1.3` и `Rails 7.0.1`

## Установка

Установите `Bundler`:
```
bundle install
```

Сгенерируйте свой `master.key` и `credentials.yml.enc`:
```
rails credentials:edit
```

Создайте БД:
```
rails db:create
```

Запустите миграции:
```
rails db:migrate
```

Запустите сервер:
```
rails s
```
