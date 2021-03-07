FROM nginx
ENV AUTHOR=Johnson

WORKDIR /usr/share/nginx/html

COPY hello_world.html /usr/share/nginx/html

CMD cd /usr/share/nginx/html && sed -e s/Docker/"$AUTHOR"/ hello_world.html > index.html ; nginx -g 'daemon off;' 