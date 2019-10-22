FROM ruby:2.5.6

RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri and JS runtime
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME