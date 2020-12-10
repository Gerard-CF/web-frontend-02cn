FROM nginxinc:latest

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

RUN sed -i.bak 's/listen\(.*\)80;/listen 8888;/' /etc/nginx/conf.d/default.conf
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
# output port set WORKDIR to app

EXPOSE 8888

#CMD ["nginx", "-g", "daemon off;"]
