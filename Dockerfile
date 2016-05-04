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
    libgcrypt20-dev pwgen libmuparser-dev libboost-graph-dev libjpeg-dev 
RUN debconf-set-selections <<< "postfix postfix/mailname string wimarksystems.com" && \
    debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'" && \
    apt-get install -qq -y postfix mutt
RUN pip install requests django colorlog psutil tabulate fabric pillow
