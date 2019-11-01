### Sales report by Anastasiia Tulentseva

To run application:

1. Install needed gems 

       bundle install
       
2. Create SQlite database 

       bundle exec rake db:create
       
3. Migrate the database 

       bundle exec rake db:migrate
       
4. Seed the database 

       bundle exec rake db:seed
       
5. Run the rails server 

       bundle exec rails s
       
6. Run sidekiq 

       bundle exec sidekiq

To run tests:
          
    bundle exec rspec spec
    
To create new records send POST request
```
curl -X POST \
  http://localhost:3000/api/messages \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "email": "john@test.com", 
    "first_name": "John", 
    "last_name": "Snow", 
    "amount": 500.67
}'
```
