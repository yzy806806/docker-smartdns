FROM debian:stretch

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt-get update \
  && apt-get install -y libssl1.0.0 \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/pymumu/smartdns/releases/download/Release21/smartdns.1.2019.03.02-1141.x86_64.tar.gz \
  && tar zxvf smartdns.1.2019.03.02-1141.x86_64.tar.gz \
  && cp smartdns/src/smartdns /start \
  && rm -rf smartdns* \
  && apt-get --purge remove wget

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]