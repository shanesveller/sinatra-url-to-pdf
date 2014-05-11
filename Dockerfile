FROM ubuntu:14.04
MAINTAINER Shane Sveller <shanesveller@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y bundler curl && \
    apt-get build-dep -y wkhtmltopdf && \
    apt-get clean -y

WORKDIR /opt/
RUN curl -L "http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.1-dev/wkhtmltox-0.12.1-c22928d_linux-wheezy-amd64.tar.xz" | tar xJf -
RUN ln -s /opt/wkhtmltox-0.12.1-c22928d/bin/wkhtmltopdf /usr/local/bin/

ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN cd /app && bundle install --deployment --without development,test
ADD app.rb /app/

EXPOSE 4567
WORKDIR /app/
CMD bundle exec ruby app.rb
