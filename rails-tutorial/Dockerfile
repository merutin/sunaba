FROM ruby:2.6

# DebianのaptリポジトリのURLをアーカイブ版に変更し、stretch-updatesを削除
# RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
#            -e 's|security.debian.org|archive.debian.org/|g' \
#            -e '/stretch-updates/d' /etc/apt/sources.list
# RUN echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/100no-check-valid; 

RUN apt-get update && apt-get install -y nodejs imagemagick

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
