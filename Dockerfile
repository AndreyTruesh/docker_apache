FROM	debian:buster

RUN		apt-get -y		update
RUN		apt-get -y		install \
						vim	\
						mariadb-server \
						php7.3 \
						php7.3-mysql \
						php7.3-cli \
						php7.3-fpm \
						php7.3-curl \
						php7.3-cgi \
						php7.3-mbstring \
						apache2 \
						apache2-utils \
						libapache2-mod-php7.3 \
						php7.3-gd

COPY	./srcs ./

EXPOSE	80 443

CMD		bash setup.sh
