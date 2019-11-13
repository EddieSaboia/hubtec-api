# README

This README would normally document whatever steps are necessary to get the
application up and running.

Step by step to run the project in localhost using docker-compose
1. Download the project from GitHub
git clone 
Open the project folder.

Build the containers.

docker-compose build
Install dependencies.
docker-compose run --rm app bundle install
Run migrations
docker-compose run --rm app bundle exec rake db:create db:migrate
Start the server
docker-compose up
