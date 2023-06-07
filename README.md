## Ask_me

[Ask_me](http:/www.ilyaz.site) - Простой аналог популярного сервиса [ask.fm](https://ask.fm/), позволяющий пользователям задавать друг другу вопросы и отвечать на них.

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
