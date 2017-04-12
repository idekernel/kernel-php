FROM php
RUN docker-php-source extract \
	# do important things \
	php-zmq \
	&& docker-php-source delete
