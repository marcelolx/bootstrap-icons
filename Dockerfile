FROM circleci/ruby:2.6.6-node-browsers

USER root

RUN set -x \
  && apt-get update \
  && wget --quiet -O - https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get update

RUN sudo mkdir -p /app

RUN gem update --system
RUN gem install bundler

ENV BUNDLE_APP_CONFIG=/app/.bundle/

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/docker-entrypoint.sh"]
