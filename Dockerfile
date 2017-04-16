FROM idekernel/kernel
FROM php
RUN apt-get update && apt-get install -y \
                php5-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng12-dev \
		wget \
		vim \
		git \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd
USER root
#install zeromq
RUN wget --quiet https://github.com/zeromq/libzmq/releases/download/v4.2.1/zeromq-4.2.1.tar.gz \
	&& tar zxvf zeromq-4.2.1.tar.gz \
	&& cd zeromq-4.2.1 \
	&& ./configure --prefix=/usr/local/zeromq \
	&& make \
	&& make install
#install php-zmq
RUN git clone https://github.com/mkoppanen/php-zmq.git \
	&& cd php-zmq \
	&& /usr/local/php/bin/phpize \
	&& ./configure --with-php-config=/usr/local/php/bin/php-config  --with-zmq=/usr/local/zeromq \
	&& make \
	&& make install
#RUN php -r "eval('?>'.file_get_contents('http://getcomposer.org/installer'));"
RUN wget --quiet https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar && \
    php ./jupyter-php-installer.phar install
USER $NB_USER
