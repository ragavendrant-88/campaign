# README

Steps to run this application:

1. To Build Image `docker-compose build`

2. To Install essential packages `docker-compose run yarn install`

3. To Create Database `docker-compose run app rails db:create`

4. To Make DB Migration `docker-compose run app rails db:migrate`

5. To fetch data from facebook API and store to DB `docker-compose run app rake facebook:get_campaign_data`

6. To Make auto fetch data from facebook API and store to DB `docker-compose run app whenever --update-crontab --set environment='development'`

7. To start application `docker-compose up -d`

8. Go to Browser and open `http://localhost:3000/` URL
