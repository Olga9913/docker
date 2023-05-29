## Part 1. Готовый докер

*Установка Docker*

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

1.1 Использование команды docker pull для выкачки докера nginx

![./screenshots/docker_pull_nginx.PNG](./screenshots/docker_pull_nginx.PNG)

1.2 Проверка наличия докер образа при помощи команды docker images

![./screenshots/docker_images.png](./screenshots/docker_images.PNG)

1.3 Запуск докер образа при помощи команды docker run -d image_id

![./screenshots/docker_run_image_id.png](./screenshots/docker_run_image_id.PNG)

1.4 Проверка запуска докера при помощи команды docker ps

![./screenshots/docker_ps.png](./screenshots/docker_ps.PNG)

1.5 Просмотр информации о контейнере при помощи команды docker inspect container_id

![./screenshots/docker_inspect_vim.png](./screenshots/docker_inspect_vim.PNG)

![./screenshots/docker_inspect_vim2.png](./screenshots/docker_inspect_vim2.PNG)

![./screenshots/docker_inspect_vim3.png](./screenshots/docker_inspect_vim3.PNG)

![./screenshots/docker_inspect_vim_4.png](./screenshots/docker_inspect_vim_4.PNG)

1.6 Остановка докер образа и проверка, что он остановился

![./screenshots/docker_stop.PNG](./screenshots/docker_stop.PNG)

1.7 Запуск докера с замапленными портами 80 и 443

![./screenshots/mapped_ports.png](./screenshots/mapped_ports.PNG)

1.8 Проверка на доступность стартовой страницы nginx по адресу localhost:80 в браузере

![./screenshots/curl_localhost_80.png](./screenshots/curl_localhost_80.PNG)

1.9 Перезапуск докера и проверка, что он запустился

![./screenshots/docker_restart.png](./screenshots/docker_restart.PNG)

## Part 2. Операции с контейнером

2.1 Вывод содрежимого файла nginx.conf

![./screenshots/nginx_conf.png](./screenshots/nginx_conf.PNG)

2.2 Создание на локальной машине файла nginx.conf. Настройка в нем по пути /status отдачу страницы статуса сервера

![./screenshots/my_nginx_conf.png](./screenshots/my_nginx_conf.PNG)

2.3 Копирование файла nginx.conf внутрь докер образа. Перезапуск nginx внутри докер рбраза. Проверка статуса сервера

![./screenshots/nginx_plus_docker.png](./screenshots/nginx_plus_docker.PNG)

2.4 Экспорт контейнера в файл. Остановка контейнера

![./screenshots/export_stop.png](./screenshots/export_stop.PNG)

2.5 Удаление образа

![./screenshots/remove_image.png](./screenshots/remove_image.PNG)

2.6 Удаление остановленного контейнера

![./screenshots/remove_container.png](./screenshots/remove_container.PNG)

2.7 Импорт контейнера обратно. Запуск импортированного контейнера. Проверка работоспособности контейнера

![./screenshots/import_docker.png](./screenshots/import_docker.PNG)

## Part 3. Мини веб-сервер

3.1 Создание сервера на языке С

![./ccreenshots/server_c.png](./screenshots/server_c.PNG)

3.2 Создание nginx.conf

![./screenshots/nginx_conf_server_3.png](./screenshots/nginx_conf_server_3.PNG)

3.3 Выкачка докера nginx. Проверка, что загрузка прошла успешно. Запуск образа и проверка, что он запустился

![./screenshots/check_exec.png](./screenshots/check_exec.PNG)

3.4 Копирование nginx.conf и server.c в докер-контейнер

![./screenshots/copy.png](./screenshots/copy.PNG)

3.5 Вход в сам контейнер. Проверка, что файлы успешно скопировались

![./screenshots/check_copy.png](./screenshots/check_copy.PNG)

![./screenshots/check_copy_server.png](./screenshots/check_copy_server.PNG)

3.6 Обновление контейнера. Установка gcc, spawn-dcgi, libfcgi-dev

```bash
apt-get update
apt-get install -y gcc spawn-fcgi libfcgi-dev
```

3.7 Компиляция и запуск нашего сервера

![./screenshots/compile_spawn.png](./screenshots/compile_spawn.PNG)

3.8 Перезагрузка контейнера и проверка страницы в браузере

![./screenshots/reload.png](./screenshots/reload.PNG)

![./Screenshots/curl_localhost_81.PNG](./screenshots/curl_localhost_81.PNG)

## Part 4. Свой докер

4.1 Создание докер образа.

![./screenshots/dockerfile.png](./screenshots/dockerfile.PNG)

4.2 Запуск скрипта из докера          

![./screenshots/start.png](./screenshots/start.PNG)

4.3 Сбор написанного образа. Маппинг 81 порта на 80. Проверка доступа стрички командной localhost:80   

![./screenshots/olga_doc.png](./screenshots/olga_doc.PNG)

![./screenshots/olga_doc.png](./screenshots/olga_doc2.PNG)

![./screenshots/olga_doc_map.png](./screenshots/olga_doc_map.PNG)

![./screenshots/curl_localhost_server4.png](./screenshots/curl_localhost_server4.PNG)

4.4 Проверка на корректность сборки   

![./screenshots/part4.png](./screenshots/part4.PNG)

4.5 Добавление в файл nginx.conf проксирование странички /status      

![./screenshots/status_on.png](./screenshots/status_on.PNG)

4.6 Проверка странички /status               

![./screenshots/status_check.png](./screenshots/status_check.PNG)

## Part 5. **Dockle**

*Dockle installation*
*https://temofeev.ru/info/articles/dockle-diagnostika-bezopasnosti-konteynerov/*

```bash
#Ubuntu
VERSION=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
) && curl -L -o dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb
sudo dpkg -i dockle.deb && rm dockle.deb
```

![./screenshots/dockle_installed.png](./screenshots/dockle_installed.PNG)

5.1 Сканирование образа    

*Dockle не работает по ID, ему нужно имя репозитрия - ```olga_doc:new```*

```bash
dockle olga_doc:new
```

![./screenshots/dockle_scan.png](./screenshots/dockle_scan.PNG)

*Вспомогательный сайт для исправления ошибок*
*https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md*

5.2 Проверка на отсутствие ошибок и предупреждений после исправления образа                    

![./screenshots/dockle_solved.png](./screenshots/dockle_solved.PNG)

## Part 6. Базовый **Docker Compose**

6.1 Файл docker-compose.yml       

![./screenshots/doc_comp_file.png](./screenshots/doc_comp_file.PNG)

*Собрать и запустить проект с помощью команд docker-compose build и docker-compose up*

```bash
docker-compose build
```

![./screenshots/doc_comp_build.png](./screenshots/doc_comp_build.PNG)

*Проверка образов и контейнеров*

![./screenshots/doc_comp_check.png](./screenshots/doc_comp_check.PNG)

6.2 Проверка на работоспособность после сборки и запуска
          
![./screenshots/doc_comp_done.png](./screenshots/doc_comp_done.PNG)