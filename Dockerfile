FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /spree
WORKDIR /spree
ADD . /spree
RUN bundle install
RUN bundle exec rake sandbox
CMD ["sh", "docker-entrypoint.sh"]
