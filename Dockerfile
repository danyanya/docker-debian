#  
# danyanya debian version
#

FROM debian

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get -qq update
RUN apt-get install -y curl ssh sshpass git zip autoconf \
    libtool python python-pip python-dev php5-dev libevent-dev \
    libconfig++-dev libsnmp-dev sqlite3 apache2 libapache2-mod-wsgi \
    sudo supervisor rsyslog net-tools valgrind nano vim libgnutls28-dev \
    libgcrypt20-dev pwgen libmuparser-dev libboost-graph-dev libjpeg-dev uuid-dev \
    libev4 libev-dev 
RUN debconf-set-selections <<< "postfix postfix/mailname string wimarksystems.com" && \
    debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'" && \
    apt-get install -qq -y postfix mutt
RUN easy_install django==1.9  
RUN pip install requests colorlog psutil tabulate fabric pillow pyparsing pylibconfig2
RUN pip install cassandra-driver django_cassandra_engine pandas
RUN apt-get install -y libuv0.10 libuv0.10-dev cmake
RUN git clone https://github.com/datastax/cpp-driver.git && \
    mkdir cpp-driver/build && cd cpp-driver/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make && make install
