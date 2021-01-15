# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. This was my first time using Rails.

## Design Decisions

- self-hosted a la Nextcloud. Hence, no access control. A demo app is set up on Heroku, which supports all types except local files.
- image URL is sent in POST body; GET params is less secure
- API versioning
- pure backend. use Postman to hit endpoints. there is also a view option, but it is currently not secure. i should add some encryption. 

## Improvements
- finer access control e.g. with firebase, or nhouse system
- may add frontend widgets in future with JS, for enhanced UX
- security eg. CRSF

## Guides