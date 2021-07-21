FROM nginx:latest
COPY ./crypto.conf /etc/nginx/conf.d/
EXPOSE 80