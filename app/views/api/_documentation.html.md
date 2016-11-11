This document describes version 1 of the JSON API.

# Contents
{:.no_toc}

* Will be replaced with the ToC, excluding the "Contents" header
{:toc}

# API endpoint

    <%= root_url %>api/v1/

# Basics

The API uses JSON data for exchanging information. In order to work properly the
user has to set the `Content-Type` header for all requests to
`application/json`:

    Content-Type: application/json

Curl example:

    curl -H 'Content-Type: application/json'

# Authentication

The API uses a token based method for authenticating a user. The API token is
generated in the web interface. It has the following form:

    S6aTrDojNePcL36phpsM3Zcd

The API token has to be send with every request in the form of the HTTP header
`Authorization`. Because the API uses a token based approach, the authorization
method must be set to `Token`:

    Authorization: Token token=S6aTrDojNePcL36phpsM3Zcd

Curl example:

    curl -H 'Authorization: Token token=S6aTrDojNePcL36phpsM3Zcd'

# Domains

## List all domains

`GET`: <%= root_url %>api/v1/domains

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains

## Get single domain

`GET`: <%= root_url %>api/v1/domains/:id

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1

## Create domain

`POST`: <%= root_url %>api/v1/domains

Data:

    {
      "name": "example.com",
      "master": null,
      "type": "MASTER"
    }

Curl example:

    curl -vX POST -d '{"name":"example.com","type":"MASTER"}' <%= root_url %>api/v1/domains

## Update domain

`PUT`/`PATCH`: <%= root_url %>api/v1/domains/:id

Data:

    {
      "name": "example.com",
      "master": null,
      "type": "MASTER"
    }

Curl example:

    curl -vX PUT -d '{"name":"example.com","type":"MASTER"}' <%= root_url %>api/v1/domains/1
    curl -vX PATCH -d '{"name":"example.com","type":"MASTER"}' <%= root_url %>api/v1/domains/1

## Delete domain

`DELETE`: <%= root_url %>api/v1/domains/:id

Curl example:

    curl -vX DELETE <%= root_url %>api/v1/domains/1

# Records

## List all records of a domain

`GET`: <%= root_url %>api/v1/domains/:domain_id/records

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1/records

## Get single record of domain

`GET`: <%= root_url %>api/v1/domains/:domain_id/records/:id

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1/records/1

## Create record

`POST`: <%= root_url %>api/v1/domains/:domain_id/records

Data:

    {
      "name": "www.example.com",
      "type": "A",
      "content": "127.0.0.1",
      "ttl": 300,
      "prio": null,
      "disabled": false
    }

Curl example:

    curl -vX POST -d '{"name":"www.example.com","type":"A","content":"127.0.0.1","ttl":300}' <%= root_url %>api/v1/domains/1/records

## Update record

`PUT`/`PATCH`: <%= root_url %>api/v1/domains/:domain_id/records/:id

Data:

    {
      "name": "www.example.com",
      "type": "A",
      "content": "127.0.0.2",
      "ttl": 3600,
      "prio": null,
      "disabled": false
    }

Curl example:

    curl -vX PUT -d '{"name":"www.example.com","type":"A","content":"127.0.0.2","ttl":3600}' <%= root_url %>api/v1/domains/1/records/1
    curl -vX PATCH -d '{"name":"www.example.com","type":"A","content":"127.0.0.2","ttl":3600}' <%= root_url %>api/v1/domains/1/records/1

## Delete record

`DELETE`: <%= root_url %>api/v1/domains/:domain_id/records/:id

Curl example:

    curl -vX DELETE <%= root_url %>api/v1/domains/1/records/1
