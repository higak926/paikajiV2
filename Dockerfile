FROM ruby:2.6.2-alpine3.9
ARG RAILS_ENV="development"
ARG RAILS_MASTER_KEY

RUN apk add --update build-base \
                     mysql-dev \
                     nodejs \
                     tzdata \
                     git \
                     mysql-client \
                     yarn \
                     less \
                     vim \
                     coreutils \
    && rm -rf /var/cache/apk/* \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo 'gem: --no-document' > ~/.gemrc \
    && mkdir /app

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN if [ $RAILS_ENV != "development" ]; then RAILS_ENV=$RAILS_ENV bundle exec rails assets:precompile --trace; fi

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-p", "3000", "-C", "config/puma.rb"]
