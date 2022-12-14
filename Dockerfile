FROM node:15.12 as node15
FROM ruby:3.1.2

WORKDIR /backend
COPY --from=node15 . .
COPY Gemfile Gemfile.lock /backend/
COPY package*.json ./backend/
COPY entrypoint.sh /usr/bin/
RUN apt-get update                                                            \
    && apt-get install -y curl                                                \
    && curl -sL htt.ps://deb.nodesource.com/setup_15.x       | bash -         \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg     | apt-key add -  \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" |                \
    tee /etc/apt/sources.list.d/yarn.list                                     \
    && apt-get install -y --no-install-recommends build-essential             \
                                                  libpq-dev                   \
                                                  postgresql-client           \
                                                  nodejs                      \
                                                  yarn                        \
                                                  npm                         \
    && gem install bundler:2.3.22                                             \
                   ruby-debug-ide:0.7.3                                       \
                   debase:0.2.5.beta2                                         \
    && bundle install                                                         \
    && chmod +x /usr/bin/entrypoint.sh && npm install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
