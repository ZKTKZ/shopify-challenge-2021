# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. This is intended as a self-hosted solution that enables users to upload images, search based on ML-detected image features, and view all of their available images. An accompanying POC frontend is also presented.


## Getting Started

0. Clone this repo by typing in ...
1. Create an account with Okta, and replace 'XXXX' in config/application.yml
2. Create an account with Cloudinary, and replace 'XXXX' in config/cloudinary.yml
3. To start the server, run `bin/rails s` from the root

## Overview 
- The app follows the MVC paradigm. I used this challenge as an opportunity to learn Ruby on Rails, and so it is the language of choice. User authentication is managed by Okta SSO, and Cloudinary is used as a CDN. ActiveRecord Sessions enable a user's login state to be tracked across different pages in the application. Fpr styling, we use PicoCSS.
### Tests
Unit tests for models are in the models folder under `/tests`

### Models

`users`

`sessions`

### Routes
`/config/routes.rb`
The following routes are relevant for the end user:

/photos/search

/photos/create

/photos/show

N.B. Cloudinary may take upto 5 minutes to show newly uploaded assets.

### Controllers
`/app/controllers`


### Potential Improvements
Some features of this project would ideally be revamped for a proper production context. A few ideas:
- Use Ruby namespaces for api versioning
- Move from sqlite to Postgres database, as...
- Integration testing of controllers, to enable new features without breaking existing functionality
- Use partials for duplicate view logic per DRY coding standards
- Cloud-hosted deployment. Cloudinary and Okta libraries for security are both expensive services ($100/month for Cloudinary alone), so an already-deployed version was not launched
