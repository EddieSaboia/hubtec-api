# README


<h2>Como usar</h2>
1. Download do projeto no GitHub
</br>git clone https://github.com/EddieSaboia/hubtec-api.git

2. Abrir pasta do projeto.

3. Build os containers.
</br>docker-compose build

4. Instalar as dependencias.
</br>docker-compose run --rm app bundle install

5. Run migrations
</br>docker-compose run --rm app bundle exec rake db:create db:migrate

6. Start o server
</br>docker-compose up
