# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. It enables users to upload images, search based on image features (auto tagging) and view all of their images. The app follows the MVC paradigm and was built with Ruby on Rails, which I learnt concurrently. User authentication is managed by Okta SSO, and Cloudinary is used as a CDN. 


## Getting Started
## Design 

- self-hosted a la Nextcloud. Hence, no access control. A demo app is set up on Heroku, which supports all types except local files.
- image URL is sent in POST body; GET params is less secure
- API versioning


## Improvements
- more sophisticated access control markers
- move from sqlite to PG or something
