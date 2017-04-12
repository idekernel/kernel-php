FROM idekernel/kernel
FROM php
RUN docker-php-source extract \
	# do important things \
	php-zmq \
	&& docker-php-source delete
RUN wget --quiet https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar && \
    ./jupyter-php-installer.phar install
