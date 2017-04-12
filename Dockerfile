FROM php
RUN docker-php-source extract \
	# do important things \
	&& docker-php-source delete
