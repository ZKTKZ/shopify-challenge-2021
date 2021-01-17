# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. This is intended as a self-hosted server solution  that enables users to upload images, search based on image features (auto tagging) and view all of their images. 


## Getting Started

0. Clone this repo by typing in ...
1. Create an account with Okta, and replace 'XXXX' in config/application.yml
2. Create an account with Cloudinary, and replace 'XXXX' in config/cloudinary.yml
3. To start the server, run `bin/rails s` from the root

The following routes are relevant for the end user:

/photos/search

/photos/create

/photos/show

## Design 
- The app follows the MVC paradigm. I used this challenge as an opportunity to learn Ruby on Rails, and so it is the language of choice. User authentication is managed by Okta SSO, and Cloudinary is used as a CDN. 
- Originally intended to build pure backend, with corresponding Postman collection. [But Postman and Okta compatibility is an open issue](https://github.com/postmanlabs/postman-app-support/issues/2646), hence I created a very primitive HTML view 
- /index and /search JSON views rerndered with JBuilder 
- API versioning with namespaces

## Overview
### Tests
Unit tests for models and controllers are in their respective subfolders within '/test'

### Controllers

### Model

### View



### Improvements
Some features of this project would ideally be revamped for a proper production context. A few ideas:
- Use Ruby namespaces for api versioning.
- Move from sqlite to Postgres database, as...
- Integration testing of multiple controllers, to enable new features without breaking existing functionality
