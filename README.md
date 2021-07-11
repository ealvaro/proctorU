# README
Create a Ruby on Rails API endpoint that accepts the following User information and abides by the following Acceptance Criteria:

Request parameters:

{
  first_name: String,

  last_name: String,
  
  phone_number: String,
  
  college_id: Integer,
  
  exam_id: Integer,
  
  start_time: DateTime

}

Acceptance Criteria:

A client can send the above request and expect the following behavior

* A successful (200 OK) response if:
    * the request data is valid and sanitized
    * a college exists in the database (college_id)
    * an exam exists and belongs to the college (exam_id)
    * a user is successfully found or created, and assigned to the exam
    * the start_time of the request falls within an Exam's time window

* A bad request (400) response with appropriate error message if:
    * the request data is invalid or not clean
    * a college with the given college_id is not found
    * an exam with the given exam_id is not found or does not belong to the college
    * a user fails to be found or created, or failed to get associated with the exam
    * a requested start_time does not fall with in an exam's time window

Data Models to Consider:

* User
* College
* Exam
* ExamWindow
* ApiRequest (bonus points for logging requests and errors)


Architectural questions to consider:

* Does the code function?
* Is the code understandable?
* Is the code maintainable? Modular?
* Does the code have redundancy? Is there related code that can be deleted?
* Does the code have performance issues?
* Does the code have security vulnerabilities?
* Is the code testable?
* Is the code tested? (System/Unit)
* Is it easy for developers to set up this project? (Seed data)

Specs:

* Ruby version

2.7.2

* System dependencies

`faker` gem for seeds
`rspec` gem for testing
`pg` gem for postgres DB
`jbuilder` for templating
`dotenv-rails` for env. vars. management

* Webapp VM creation

```shell
sudo docker build .
```

* Webapp & Database VMs composition and start
```shell
sudo docker-compose build
sudo docker-compose up
```

* Database initialization (run from a different console)
```shell
sudo docker-compose run app rake db:create db:migrate db:seed
```

* How to run the test suite

```shell
sudo docker-compose run app rspec spec/requests/validate_user.rb
```

* How to test it from a web browser

** Get all users
<http://localhost:3000/users.json>

* How to stop the webapp and database

```shell
sudo docker-compose stop
```

* Assumptions

Some of the endpoint specs were not determined so the following assumptions were made:

* endpoint was named `validate`
* endpoint is a POST and must have a body with the Request parameters in json format
* user id for the user to be validated must be passed as a path parameter
* response is either 200 with following json response
```json
{
    "response":"Valid User"
}
```
* or response is 400 with following json response or similar 
```json
{
    "validation_error": [
        "Missing/Invalid Start Time"
    ]
}
```

* Testing the `validate` endpoint (make sure the testing data exists in your db or you will get validation errors)
```shell
curl -i -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d '{
  "first_name": "Ji",
  "last_name": "Legros",
  "phone_number": "853-715-9077",
  "college_id": 4,
  "exam_id": 16,
  "start_time": "2021-04-24 11:30:00"
}' http://localhost:3000/users/3/validate
```

* Testing the `list of users` endpoint
```shell
curl -i -X GET -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:3000/users
```
