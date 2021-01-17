# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. It enables users to upload images, search based on image features (auto tagging) and view all of their images. 


## Getting Started

1. Go to <INSERT_URL>
2. Create an account with Okta in the center bottom
3. You should be redirected to the homepage. To get started, upload an image. Ideally, upload a bunch if you want to play with the search functionality
4. Click on link to see all your images
4. Click on the link to 'search' based on tags. You may want to reference tags of each imagae from the home page
## Design 
- The app follows the MVC paradigm. I used this challenge as an opportunity to learn Ruby on Rails, and so it is the language of choice. User authentication is managed by Okta SSO, and Cloudinary is used as a CDN. 
- Originally intended to build pure backend, with corresponding Postman collection. [But Postman and Okta compatibility is an open issue](https://github.com/postmanlabs/postman-app-support/issues/2646), hence I ultimately built a frontend search, + Upload widget (JS)
- /index and /search JSON views rerndered with JBuilder 
- API versioning with namespaces



## Improvements
- more sophisticated access control markers
- move from sqlite to PG or something
