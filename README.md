# PowerDNS Admin Panel

## Installation

Create `docker-compose.yml` file by copying:

    # cp docker-compose.yml-dist docker-compose.yml

Change options `SECRET_KEY_BASE` and `volumes`. For `SECRET_KEY_BASE` generate
a new secret:

    # bundle exec rake secret

Build Docker image:

    # docker-compose build

Start new instance:

    # docker-compose up -d
