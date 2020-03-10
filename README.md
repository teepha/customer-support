# Customer Support App

Customer Support is an app that helps an organization to manage customer service requests and interact with the customers to resolve their support tickets. The system allows customers to be able to place support request and the support agents to process the request.

## Getting started

## Installation

In order to install and run this project locally, you would need to have the following installed on you local machine.

- [**Ruby 2.6.0**](https://nodejs.org/en/)
- [**MySQL**](https://www.mysql.com/downloads/)
- [**Bundle gem**](https://https://bundler.io/)

### Installation

Take the following steps to setup the application on your local machine:

1. Run `git clone https://github.com/teepha/customer-support.git` to clone this repository

2. Run `bundle install` to install all required gems

### Configuring the database

- Run `cp config/application.yml.sample config/application.yml` to create the `application.yml` file.

_Note_ Update the mysql username and password if you have one

```yml
MYSQL_USER: "your-mysql-username"
MYSQL_PASSWORD: "your-mysql-password"
```

- After creating your `config/application.yml`, you need to create these 2 databases `customer_support_development` and `customer_support_test`. To create them, run:

  ```bash
  rails db:create
  ```

- Next run the code below to migrate schemas that might have not been added to the database

  ```bash
  rails db:migrate
  ```

## Starting the server

* Run `rails s` to start the application

* Visit: http://localhost:3000/


## Tests

* Run test with `rspec spec`

## Assumptions made


## Limitations

* Customer Support is still in development
