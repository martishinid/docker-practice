# Практическое применение Docker

## Задача 0 - версии программ
Версии установленных программ:
docker:
```
$ docker --version
Docker version 27.0.3, build 7d4bcd8

```

docker compose:
```
$ docker compose version
Docker Compose version v2.28.1
```

## Задача 1 - web-logger

Репозиторий проекта : [https://github.com/martishinid/docker-practice](https://github.com/martishinid/docker-practice)

Сборка проекта включает следующие контейнеры ([compose.yaml](compose.yaml)):
- reverse-proxy (`haproxy`, запускается на порту _8080_)
- ingress-proxy (`nginx`, запускается на порту _8090_)
- web-logger (запускается на порту _5000_)
- mysql (запускается на порту _3306_)


Сборка контейнера с приложением (`web-logger`) осуществляется с помощью файла [Dockerfile.python](Dockerfile.python).

Требуемые переменные окружения ([.env](.env)):
- `MYSQL_ROOT_PASSWORD` - пароль для инициализации MySQL
- `MYSQL_DATABASE` - название БД в MySQL (если её нет, то создастся при первом запуске)
- `MYSQL_USER` - имя пользователя для БД (создаётся при первом запуске)
- `MYSQL_PASSWORD` - пароль для пользователя `MYSQL_USER`
- `DB_HOST` - название хоста с СУБД MySQL (для подключения приложения)
- `DB_NAME` - совпадает с `MYSQL_DATABASE`
- `DB_REQUESTS_TABLE` - название таблицы, в которой будет хранится статистика посещений
- `DB_USER` - совпадает с `MYSQL_USER`
- `DB_PASSWORD` - совпадает с `MYSQL_PASSWORD`
- `APP_PORT` - порт, на котором будет запускаться приложение


## Задача 2  - Yandex.Cloud

Создан репозиторий в Yandex.Cloud. Туда и на открытый репозиторий размещен образ контейнера web-logger ([https://hub.docker.com/repository/docker/martishinid/docker-practice]).

Результаты сканирования в Yandex.Cloud на рисунке.

![сканирование](https://github.com/user-attachments/assets/5aaf4283-7692-4b8a-a519-f8fd3619f22c)



## Задача 3  - сборка контейнеров


Подробно описано в **задаче 1**.

Результаты выполнения SQL-запросов в `adminer`-е приведены ниже.

```
show databases; 
use virtd; 
show tables; 
SELECT * from logs LIMIT 10;
```

Результаты:

![Снимок экрана от 2024-07-05 22-55-18](https://github.com/user-attachments/assets/7db0db4f-a513-4ab8-b9aa-26f8dba7cbb4)



## Задача 4  - проверка Интернет-ресурса

Скрипт, копирующий исходный код на ВМ в Yandex.Cloud в файле [script.sh](script.sh).

_P.S. При большом числе подключений приложение вылетало, спасала только перезагрузка контейнера ..._

Результаты проверки приложения с использованием сканера `https://check-host.net/check-http`

![Проверка сайта](https://github.com/user-attachments/assets/453f2f6e-ca43-4ccb-a5d5-abfd253c285d)

![Снимок экрана от 2024-07-17 13-56-31](https://github.com/user-attachments/assets/db62908a-3e2c-4d6d-9465-f34a73f8bbdc)





# Задание
[https://github.com/netology-code/virtd-homeworks/tree/shvirtd-1/05-virt-04-docker-in-practice](https://github.com/netology-code/virtd-homeworks/tree/shvirtd-1/05-virt-04-docker-in-practice)
