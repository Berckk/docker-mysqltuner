FROM debian:jessie
MAINTAINER berckk@gmail.com

ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get install -y mysql-client perl curl && \
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

# install mysqltuner
RUN	curl -sL -o /usr/local/bin/mysqltuner https://raw.githubusercontent.com/major/MySQLTuner-perl/master/mysqltuner.pl && \
	chmod +x /usr/local/bin/mysqltuner

ENTRYPOINT ["/usr/local/bin/mysqltuner","$host","$user","$pass"]
