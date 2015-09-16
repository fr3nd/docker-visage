FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      build-essential \
      collectd \
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

CMD visage-app start
