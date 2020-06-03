# OAuth Poc with Doorkeeper

## Dependencies

- Ruby 2.6.6

## Setup

- `bundle install`
- `rake db:create db:migrate`
- `rails s`

## Insomnia Docs

I exported an Insomnia json file with tested endpoints. Just download [Insomnia Core](https://insomnia.rest/download/) and import the `docs/insomnia/oauth-poc.json` file there.

## Grant types covered

- [X] Password grant type
- [X] Refresh Token grant type
- [X] Client Credentials grant type
- [ ] Authorization Code grant type
