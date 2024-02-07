FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install apache2

RUN echo 'Hello World from Docker!' > /var/www/html/index.html

# Установка Node.js и NPM
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    nodejs -v && \
    npm -v

# Копирование вашего приложения и установка зависимостей
COPY . /app
WORKDIR /app
RUN npm install

CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND", "npm", "test"]
EXPOSE 80