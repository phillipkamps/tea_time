# Welcome to Tea Time!

This 'lil backend app exposes 3 endpoints for a fictional tea subscripiton service.

### To get started:
1. clone this repo
1. cd into the app's directory 
1. in the cli, run ```bundle```
1. in the cli, run ```rails db:{drop,create,migrate,seed}```
1. in the cli , run ```rails s```
1. open your browser, postman, or similar and test out the endpoints!
___________________________________________________________________________________________________________________________________________________________
**By default, there are 10 users with IDs 1-10, each user has a random number of subscriptions to a random number of teas (1-5)**

**Use the endpoint below to get subscription/ tea IDs if needed**
___________________________________________________________________________________________________________________________________________________________
## Endpoints

### Create a subscription for a customer to a tea
```http://localhost:3000/api/v1/customers/[INSERT CUSTOMER ID]/subscriptions/[INSERT TEA ID]```

* When sending a post request, a body MUST be sent in JSON format with the `price` and `frequency` attributes defined, e.g:
```
{
  "price": "4.99",
  "frequency": "Monthly"
}
```
* subscription title will be auto-generated, and status will automatically be set to `"Active"` upon creation
### Update a subscription
```http://localhost:3000/api/v1/subscriptions/[INSERT SUBSCRIPTION ID]```

* When sending a patch request, a body needs to be sent in JSON format with the attribute(s) you wish to update, e.g:
```
{
  "status": "Cancelled"
}
```
   
### Get a list of all subscriptions for a customer
```http://localhost:3000/api/v1/customers/[INSERT CUSTOMER ID]/subscriptions```


___________________________________________________________________________________________________________________________________________________________


#### For the curious:

* Ruby 2.7.2
* Rails 5.2.8.1

* To run test suite: ```bundle exec rspec```
* To view test coverage: ```open coverage/index.html```
