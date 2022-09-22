# Who's Free?

## Development

### Environment

Who's Free? runs on Ruby 3.0.4 and Rails 7. To run the database refresh script, you need Python >= 3.9 and pandas.

[rbenv](https://github.com/rbenv/rbenv) is the recommended environment manager for this project. See that project's readme for installation instructions.

### Dependencies

Make sure you have `bundler` installed (run `gem install bundler` if you don't). After cloning the repository, run `bundle install`.

### Database

This project currently uses the default sqlite setup for development, testing, and production. After setting up the database by running `rails db:migrate`, you can populate the database by running `rails db:seed`.

The database needs to be refreshed before the beginning of a new semester. To do so, run `sudo ./scripts/refresh.sh` in the app's root directory. As written, this script only works on the development and test databases.

### Testing

This project uses the Rails default Minitest framework. Run tests with `bin/rails test:all`.

## Deployment

This project uses Docker for deployment.

Locally or on your deployment Docker host, run `docker-compose up` in the app's root directory to launch the production version of the app.

## Bug Reports and Feature Requests

Please open an issue at https://github.com/blackerby/school-on-rails/issues with any bug reports or feature requests.
