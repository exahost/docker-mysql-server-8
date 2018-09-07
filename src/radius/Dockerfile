FROM alpine:latest
MAINTAINER Alexander Umnov <a.umnov@exahost.ru>

#WORKDIR /projects

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-mysql freeradius-radclient openssl-dev tzdata && \
    chgrp radius /usr/sbin/radiusd && chmod g+rwx /usr/sbin/radiusd && \
    rm /var/cache/apk/* && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

COPY config/raddb/ /etc/raddb/
RUN chgrp -R radius /etc/raddb && cd /etc/raddb/mods-enabled && \
    ln -s ../mods-available/sql sql
RUN MYSQL_DB=radius && MYSQL_USER=radius && MYSQL_USER_PASSWORD=DwpESs7751eY
RUN sed -i "s/driver = \"rlm_sql_null\"/driver = \"rlm_sql_mysql\"/" /etc/raddb/mods-available/sql && \
    sed -i "s/dialect = \"sqlite\"/dialect = \"mysql\"/" /etc/raddb/mods-available/sql && \
    sed -i "s/server = \"localhost\"/server = \"db\"/" /etc/raddb/mods-available/sql && \
	sed -i "s/password = \"radpass\"/password = \"DwpESs7751eY\"/" /etc/raddb/mods-available/sql
#    sed -i "s/login = \"radius\"/login = \"$MYSQL_USER\"/" /etc/raddb/mods-available/sql && \
#    sed -i "s/password = \"radpass\"/password = \"$MYSQL_USER_PASSWORD\"/" /etc/raddb/mods-available/sql && \
#    sed -i "s/radius_db = \"radius\"/radius_db = \"$MYSQL_DB\"/" /etc/raddb/mods-available/sql


#VOLUME \
#    /opt/db/ \
#    /etc/freeradius/certs

EXPOSE \
    1812/udp \
    1813/udp

CMD ["radiusd","-xx","-f"]
