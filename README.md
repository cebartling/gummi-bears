# gummi-bears

Gummi Bears is a Ruby on Rails system that provides investment information via GraphQL APIs.

## Local development

### Services via Docker Compose

- To start the services, type `docker-compose up -d` to run the services in detached mode.
- To stop the services, type `docker-compose down` to terminate the service processes. 
- To stop the services and remove the volumes created by the database service, type `docker-compose down --volumes`.

### Running tests

Tests are written in RSpec. From the command line, run `bundle exec rspec` to run the entire specification suite.


## Heroku Deployment

https://devcenter.heroku.com/articles/getting-started-with-rails6#local-setup



