FROM ruby:3.2.2

LABEL maintainer="https://github.com/PatRogala"

RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install yarn && \
    apt-get install -yqq libvips && \
    apt-get install imagemagick -y && \
    apt-get install postgresql-client -y


COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/

RUN yarn install

EXPOSE 3000

ENV RAILS_ENV=development

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/dev"]
