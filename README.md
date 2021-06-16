# README

Steps to run this application:

1. Clone campaign repository to local

2. Create `master.key` file inside `rails/config` and insert key into the file`(master.key)`

3. To Build Image `docker-compose build`

4. To Install essential packages `docker-compose run app yarn install`

5. To Create Database `docker-compose run app rails db:create`

6. To Make DB Migration `docker-compose run app rails db:migrate`

7. To fetch data from facebook API and store to DB `docker-compose run app rake facebook:get_campaign_data`

8. To Make auto fetch data from facebook API and store to DB `docker-compose run app whenever --update-crontab --set environment='development'`

9. To start application `docker-compose up -d`

10. Go to Browser and open `http://localhost:3000/` URL
