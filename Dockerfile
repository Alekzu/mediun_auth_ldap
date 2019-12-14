FROM ruby:2.5.1
 
RUN mkdir /authentication_ms
WORKDIR /authentication_ms
 
ADD Gemfile /authentication_ms/Gemfile
ADD Gemfile.lock /authentication_ms/Gemfile.lock

RUN apt-get update
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN gem install bundler    

# RUN bundle update --bundler
RUN gem install bundler --pre

RUN bundle install --binstubs    
RUN bundle binstubs bundler --force

RUN bundle install


ADD . /authentication_ms
 
EXPOSE 5003
