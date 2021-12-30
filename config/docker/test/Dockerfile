FROM ruby:3.0.3

RUN apt update -qq \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

COPY Gemfile* /app/
RUN bundle install --without=development --jobs=4 \
  && bundle clean --force

COPY . /app/

EXPOSE 3000

CMD ["./bin/test"]
