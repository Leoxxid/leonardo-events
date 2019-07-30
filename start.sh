bundle check || bundle install
bash -c "rm -f tmp/pids/server.pid"
# Roda nosso servidor
bundle exec rails s -p 3000 -b '0.0.0.0'
