FROM ubuntu:latest
RUN apt update && apt install nginx openssl nano -y
COPY ./local.crypto.com.conf /
RUN openssl req -x509 -nodes -days 358000 -newkey rsa:2048 -keyout local.crypto.com.key -out local.crypto.com.crt -config local.crypto.com.conf
RUN rm local.crypto.com.conf
RUN mv local.crypto.com.key /etc/ssl/certs/
RUN mv local.crypto.com.crt /etc/ssl/private/
COPY ./crypto.conf /etc/nginx/conf.d/
EXPOSE 80
EXPOSE 443