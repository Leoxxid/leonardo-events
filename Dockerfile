FROM ruby:2.5.1
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick
# Instala o bundler 2.0
RUN gem install bundler -v 2.0.1
# Seta nosso path
ENV INSTALL_PATH /leonardo-events
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /box
# Copia nosso código para dentro do container
COPY . .
