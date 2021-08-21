FROM ubuntu:focal

ENV GIT_SOURCE="https://github.com/kx1t/planefence.git"

ENV SOURCE_PATH="/source/planefence"
ENV HTML_PATH="/var/www/localhost/htdocs/planefence"
ENV SHARE_PATH="/usr/share/planefence"

ENV OUTFILEDIR="${HTML_PATH}"

RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata
RUN apt-get install -y python3-pip python3-numpy python3-pandas python3-dateutil jq bc gnuplot git sox
RUN pip3 install tzlocal

RUN apt-get clean packages
RUN df -h
RUN apt-get install -y lighttpd
RUN mkdir -p ${HTML_PATH}
RUN cat /etc/lighttpd/lighttpd.conf && \
    lighttpd -t -f /etc/lighttpd/lighttpd.conf && \
    echo "Lighttpd is running..." > /var/www/localhost/htdocs/index.html && \
    addgroup www && \
    adduser -D -H -s /sbin/nologin -G www www

RUN mkdir -p ${SOURCE_PATH} && git clone ${GIT_SOURCE} ${SOURCE_PATH}
RUN mkdir -p ${SHARE_PATH} && chmod u+rwx,go+rx-w ${SHARE_PATH}
RUN cp ${SOURCE_PATH}/scripts/* ${SHARE_PATH} && \
    chmod a+x ${SHARE_PATH}/*.sh && \
    chmod a+x ${SHARE_PATH}/*.py && \
    chmod a+x ${SHARE_PATH}/*.pl

RUN cp ${SOURCE_PATH}/jscript/* ${HTML_PATH}/
RUN cp ${SOURCE_PATH}/systemd/start_* ${SHARE_PATH} && \
    chmod a+x ${SHARE_PATH}/start_*

RUN ls -l /var/log/lighttpd

COPY planefence.conf ${SHARE_PATH}/
COPY start.sh /start.sh

EXPOSE 80

# CMD tail -f /var/log/lighttpd/*
CMD /start.sh
