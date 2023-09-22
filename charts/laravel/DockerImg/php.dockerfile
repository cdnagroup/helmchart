FROM php:7.4-cli-alpine

# CMD ["tail", "-f","/*/**/*.log"]
# CMD ["-f","/dev/null"]
COPY ./www /usr/src/www
WORKDIR /usr/src/www
RUN apk update
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install ctype
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install json
RUN apk add oniguruma-dev
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo
RUN docker-php-ext-install tokenizer
RUN apk add libxml2-dev
RUN docker-php-ext-install xml
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install pdo_mysql 
# CMD [ "sh", "/start.sh" ]
CMD [ "php", "/usr/src/www/artisan", "serve","--port", "8000", "--host", "0.0.0.0" ]

EXPOSE 8000
# ENTRYPOINT ["tail"]
# CMD ["-f","/*/**/*.log"]
