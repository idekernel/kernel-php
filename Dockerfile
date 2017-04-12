FROM idekernel/kernel
FROM php

RUN apt-get update && apt-get -yq dist-upgrade \
    && apt-get install -yq --no-install-recommends \
    libav-tools \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    git \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-source extract \
	# do important things \
	php-zmq \
	&& docker-php-source delete
	
RUN wget --quiet https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar && \
    ./jupyter-php-installer.phar install
