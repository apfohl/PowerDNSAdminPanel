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
generated in the web interface. Your API token is:

    <%= current_user.api_token %>

The API token has to be send with every request in the form of the HTTP header
`Authorization`. Because the API uses a token based approach, the authorization
method must be set to `Token`:

    Authorization: Token token=<%= current_user.api_token %>

Curl example:

    curl -H 'Authorization: Token token=<%= current_user.api_token %>'

# Domains

## List all domains

`GET`: <%= root_url %>api/v1/domains

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains

<button class="btn" data-clipboard-text="curl -vX GET -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains">
  Copy to clipboard
</button>

## Get single domain

`GET`: <%= root_url %>api/v1/domains/:id

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1

<button class="btn" data-clipboard-text="curl -vX GET -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains/1">
  Copy to clipboard
</button>

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

<button class="btn" data-clipboard-text="curl -vX POST -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' -d '{&quot;name&quot;:&quot;example.com&quot;,&quot;type&quot;:&quot;MASTER&quot;}' <%= root_url %>api/v1/domains">
  Copy to clipboard
</button>

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

<button class="btn" data-clipboard-text="curl -vX PUT -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' -d '{&quot;name&quot;:&quot;example.com&quot;,&quot;type&quot;:&quot;MASTER&quot;}' <%= root_url %>api/v1/domains/1">
  Copy to clipboard
</button>

## Delete domain

`DELETE`: <%= root_url %>api/v1/domains/:id

Curl example:

    curl -vX DELETE <%= root_url %>api/v1/domains/1

<button class="btn" data-clipboard-text="curl -vX DELETE -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains/1">
  Copy to clipboard
</button>

# Records

## List all records of a domain

`GET`: <%= root_url %>api/v1/domains/:domain_id/records

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1/records

<button class="btn" data-clipboard-text="curl -vX GET -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains/1/records">
  Copy to clipboard
</button>

## Get single record of domain

`GET`: <%= root_url %>api/v1/domains/:domain_id/records/:id

Curl example:

    curl -vX GET <%= root_url %>api/v1/domains/1/records/1

<button class="btn" data-clipboard-text="curl -vX GET -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains/1/records/1">
  Copy to clipboard
</button>

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

<button class="btn" data-clipboard-text="curl -vX POST -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' -d '{&quot;name&quot;:&quot;www.example.com&quot;,&quot;type&quot;:&quot;A&quot;,&quot;content&quot;:&quot;127.0.0.1&quot;,&quot;ttl&quot;:300}' <%= root_url %>api/v1/domains/1/records">
  Copy to clipboard
</button>

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

<button class="btn" data-clipboard-text="curl -vX PUT -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' -d '{&quot;content&quot;:&quot;127.0.0.2&quot;}' <%= root_url %>api/v1/domains/1/records/1">
  Copy to clipboard
</button>

## Delete record

`DELETE`: <%= root_url %>api/v1/domains/:domain_id/records/:id

Curl example:

    curl -vX DELETE <%= root_url %>api/v1/domains/1/records/1

<button class="btn" data-clipboard-text="curl -vX DELETE -H 'Content-Type: application/json' -H 'Authorization: Token token=<%= current_user.api_token %>' <%= root_url %>api/v1/domains/1/records/9">
  Copy to clipboard
</button>

<script type="text/javascript">
   var clipboard = new Clipboard('.btn')
</script>
