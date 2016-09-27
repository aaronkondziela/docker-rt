FROM ubuntu

RUN apt-get update
RUN apt-get -y install build-essential git perl mariadb-server-10.0 mariadb-client-10.0 cpanminus perlbrew apache2 libapache2-mod-perl2 vim autoconf libexpat1-dev libssl-dev graphviz
COPY cpan.sh /cpan.sh
RUN bash /cpan.sh

RUN mkdir /opt/rt-src/
RUN mkdir /opt/rt4/

VOLUME /opt/rt-src

CMD bash
