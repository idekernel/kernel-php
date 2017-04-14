FROM idekernel/kernel
FROM php
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng12-dev \
		wget \
		vim \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd
USER root
#RUN php -r "eval('?>'.file_get_contents('http://getcomposer.org/installer'));"
#RUN wget --quiet https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar && \
#    php ./jupyter-php-installer.phar install
USER $NB_USER
USER root
