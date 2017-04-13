FROM idekernel/kernel
FROM php

RUN apt-get update && apt-get -yq dist-upgrade \
    && apt-get install -yq --no-install-recommends \
    libav-tools \
    wget \
    bzip2 \
    sudo \
    git \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-source extract \
	# do important things \
	composer \
	php-zmq \
	&& docker-php-source delete
USER root
#RUN php -r "eval('?>'.file_get_contents('http://getcomposer.org/installer'));"
RUN wget --quiet https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar && \
    php ./jupyter-php-installer.phar install
USER $NB_USER
