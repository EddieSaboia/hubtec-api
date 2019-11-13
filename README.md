# README

This README would normally document whatever steps are necessary to get the
application up and running.

Step by step to run the project in localhost using docker-compose
1. Download the project from GitHub
git clone https://github.com/EddieSaboia/hubtec-api.git

2. Open the project folder.

3. Build the containers.
docker-compose build

4. Install dependencies.
docker-compose run --rm app bundle install

5. Run migrations
docker-compose run --rm app bundle exec rake db:create db:migrate

6. Start the server
docker-compose up
