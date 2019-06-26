FROM ruby:2.5.1

# JS Runtime and PG dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update -qq && \
  apt-get install -y build-essential \
  default-libmysqlclient-dev \
  nodejs \
  qt5-default \
  libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools \
  gstreamer1.0-x \
  mysql-client \
  xvfb \
  imagemagick \
  redis-tools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  lsof \
  vim

# Clean!
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create work dir
ENV APP_ROOT /opt/webapp
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Install Ruby package
COPY Gemfile Gemfile.lock /tmp/
RUN cd /tmp && bundle
RUN gem install foreman

ADD . $APP_ROOT
