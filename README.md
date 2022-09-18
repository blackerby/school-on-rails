# Who's Free?

## Development

### Environment

Who's Free? runs on Ruby 3.0.4 and Rails 7.

[rbenv](https://github.com/rbenv/rbenv) is the recommended environment manager for this project. See that project's readme for installation instructions.

### Dependencies

Make sure you have `bundler` installed (run `gem install bundler` if you don't). After cloning the repository, run `bundle install`.

### Database

This project currently uses the default sqlite setup for development, testing, and production. After setting up the database by running `rails db:migrate`, you can populate the database by running `rails db:seed`.

### Testing

This project uses the Rails default Minitest framework. Run tests with `bin/rails test:all`.

## Deployment

This project uses Docker for deployment. To prepare a Docker image of the app, run `docker build -t school .` in the directory that contains the Dockerfile. Test the image locally by running `docker run -it -p 3000:3000 school`. Tag the image by running `docker tag school blackerby/school`, then push it to DockerHub with `docker push blackerby/school`.

The published image lives at https://hub.docker.com/repository/docker/blackerby/school. Run `docker pull blackerby/school` to run it on your own Docker setup.

## Bug Reports and Feature Requests

Please open an issue at https://github.com/blackerby/school-on-rails/issues with any bug reports or feature requests.
