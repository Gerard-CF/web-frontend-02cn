FROM nginx:latest
# deploy specific nginx configuration file
COPY environments/nginx.conf /etc/nginx/nginx.conf
COPY certs/server.crt /etc/nginx/certs/server.crt
COPY certs/server.key /etc/nginx/certs/server.key
COPY index.html /etc/nginx/html/index.html
COPY css/ /etc/nginx/html/css/
COPY js/ /etc/nginx/html/js/
COPY assets/ /etc/nginx/html/assets/
# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx
# output port set WORKDIR to app

EXPOSE 80
