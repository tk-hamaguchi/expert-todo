Expert ToDo
========


[![CircleCI](https://circleci.com/gh/tk-hamaguchi/expert-todo.svg?style=svg)](https://circleci.com/gh/tk-hamaguchi/expert-todo)
[![codecov](https://codecov.io/gh/tk-hamaguchi/expert-todo/branch/develop/graph/badge.svg)](https://codecov.io/gh/tk-hamaguchi/expert-todo)


開発環境構築
--------

### 依存関係

* docker
* docker-compose

### ビルド

```
git clone https://github.com/tk-hamaguchi/expert-todo.git
cd expert-todo
docker-compose -f docker-compose.development.yml up -d
bundle install -j 8
bundle exec rake db:setup
bundle exec rake expert_todo:load:demodata 
bundle exec rails s -b '0.0.0.0'
```

その後ブラウザで `http://localhost:3000` へアクセスして `demouser@example.com`、`P@ssw0rd`でログイン出来ます





--------

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
