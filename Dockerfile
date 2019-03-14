FROM kuborgh/php-5.2
LABEL version="1.0"

RUN apt-get update && \
    apt-get install curl -y && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

ARG testlink_src=https://sourceforge.net/projects/testlink/files/Older%20files/testlink_1.7.5.tar.gz

RUN curl -L $testlink_src >> /tmp/testlink.tar.gz
RUN mkdir -p /project/testlink
RUN chmod 777 /project/testlink 
RUN tar xzvf  /tmp/testlink.tar.gz --strip-components 1 -C /project/testlink  
RUN rm /tmp/testlink.tar.gz
RUN chmod 777 /project/testlink/gui/templates_c

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND