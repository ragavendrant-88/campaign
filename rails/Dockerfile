FROM ruby:2.6.2

ENV LANG C.UTF-8
ENV APP_HOME /campaignApp

RUN apt-get update -qq && apt-get install apt-transport-https && apt-get install -y build-essential nodejs

# install nodejs
RUN curl -s -L git.io/nodebrew | perl - setup
ENV PATH /root/.nodebrew/current/bin:$PATH
RUN nodebrew install-binary v10.13.0
RUN nodebrew use v10.13.0

# This is a error handling when to be occurred yarn error.
RUN apt-get update -qq && apt-get install -y curl && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install -y yarn
RUN apt-get install -y cron
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install
RUN yarn add bootstrap
RUN yarn install --check-files
COPY . $APP_HOME
CMD bash -c "bundle exec whenever --update-crontab && cron -f"
EXPOSE  3000

