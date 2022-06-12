FROM ruby:3.1.0

RUN apt update -qq \

  # Install chrome.
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
  && apt update -qq \
  && apt install -y -qq google-chrome-stable \

  && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

COPY Gemfile* /app/
RUN bundle config set --local without development \
  && bundle install --jobs=4 \
  && bundle clean --force

COPY . /app/

EXPOSE 3000

CMD ["./bin/test"]
