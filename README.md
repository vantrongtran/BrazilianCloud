# BrazilianCloud

## Prerequisites

You need to install all of this before moving to next step.

* [Git](http://git-scm.com/)
* [Docker](https://www.docker.com/)

## Installation

```bash
docker-compose build
docker-compose up -d
docker-compose run app db:create db:migrate
```

## Environment

BRAZILIAN_CLOUD_DATABASE_NAME
BRAZILIAN_CLOUD_DATABASE_USERNAME
BRAZILIAN_CLOUD_DATABASE_PASSWORD


And then, API server should be running on your [http://localhost:3000](http://localhost:3000)


**IMPORTANT!**

In case of you want to use rails, rails command without docker or run RSpec. Setup local environment variable.
You can also keep any sensitive information here.

## Login to server
* `docker-compose exec app bash -it`

## Debugger/Rails log
* `docker attach braziliancloud_app_1`

## Master Data

Login to server and running following command:
* `bundle exec rake db:migrate`
* `bundle exec rake db:seed`

## Run rspec, rubocop before push code

* `docker-compose run app rubocop`
* `docker-compose run app rspec`
