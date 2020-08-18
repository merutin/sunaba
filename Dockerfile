FROM ruby:2.5

RUN apt-get update && apt-get install -y nodejs imagemagick
RUN gem install rails -v 5.1.6 

#RUN groupadd -r merutin && useradd -r -g merutin merutin
#USER merutin
