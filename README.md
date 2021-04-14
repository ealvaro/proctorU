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
Does the code function?
Is the code understandable?
Is the code maintainable? Modular?
Does the code have redundancy? Is there related code that can be deleted?
Does the code have performance issues?
Does the code have security vulnerabilities?
Is the code testable?
Is the code tested? (System/Unit)
Is it easy for developers to set up this project? (Seed data)

* Ruby version
2.7.2

* System dependencies

* Configuration

* Database creation
sqlite

* Database initialization
seeds

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
