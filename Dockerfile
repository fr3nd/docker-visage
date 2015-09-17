FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      apache2 \
      build-essential \
      collectd \
      libapache2-mod-passenger \
      librrd-ruby \
      ruby \
      ruby-dev \
      rubygems \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV VISAGE_VERSION 2.1.0

RUN echo "gem: --bindir /usr/bin --no-ri --no-rdoc" > ~/.gemrc
RUN gem install visage-app -v $VISAGE_VERSION
COPY visage.conf /etc/apache2/sites-enabled/visage.conf
RUN a2dissite 000-default
RUN rm -f /usr/local/apache2/logs/httpd.pid
RUN mkdir -p /var/lib/visage
RUN chown nobody:nogroup /var/lib/visage

ENV CONFIG_PATH /var/lib/visage
ENV RRDDIR /var/lib/collectd/rrd

EXPOSE 80

CMD apache2ctl -DFOREGROUND
