# README

## Introduction
This image repository was developed for the Shopify Summer 2021 Challenge. This self-hosted solution allows  users to upload images, search their images based on ML-detected features, and view all available images. 


## 🚀 Getting Started

### Installation
1. Clone this repo by typing in `git clone https://github.com/ZKTKZ/shopify-challenge-2021.git`
2. Create an account with Okta, and replace 'XXXX' in config/application.yml with your credentals 
3. Create an account with Cloudinary, and replace 'XXXX' in config/cloudinary.yml with your credentals 
4. To start the server, run `bin/rails s` from the root

### Usage
1. Log in with your Okta account
2. Upload a few photos -- they can be absolute file paths, or online-hosted
3. Now, go to `/photos/search` to search for your photos. You can also view all photos by navigating to the base URL `/`.

## Overview 
The app follows the MVC paradigm. I used this challenge as an opportunity to learn Ruby on Rails.

The app supports access control, with [Devise and Okta](https://developer.okta.com/blog/2018/09/18/simple-authentication-with-rails-and-omniauth) being used for authentication, and [ActiveRecord::SessionStore](https://github.com/rails/activerecord-session_store) used to manage a user's session across the webpages. 

See the Gemfile for a comprehensive list of dependencies.

### 🧱 Models

To interact with the database, run `bin/rails c` from root, and then use [Active Record Query](https://guides.rubyonrails.org/active_record_querying.html). The application has a `User` Model used by Devise and Omniauth-Okta to create a new User at `/app/models/user.rb`. You can view `/db/migrate` to see what changes were made to the database. 

### 🗺️ Routes
`/config/routes.rb` defines the following routes
* `/photos/create`: Enter image URLs and upload them to the cloud image repository.

* `/photos/search`: Search for existing images by machine-learning generated tags. 

* `/photos/show`: View all of current user's images.

Tests are included for routing in `test/controllers/photos_controller.rb`.

N.B. Cloudinary may take upto 5 minutes to show newly uploaded assets.

### 🎮 Controllers
```
├── app/
   ├── controllers/
     ├── application_controller.rb
     ├── photos_controller.rb
     └── users.rb
      ├── omniauth_callbacks_controller.rb
```

* `ApplicationController` defines fundamentals such as CSRF protection, and ensuring that the user is logged in.

* `PhotosController` inherits from the above, and is also houses the main businss logic of the app. Namely, it implements the Cloudinary Create, Search, and Show features.

* `OmniauthCallbacksController` adds a User to the database, and also sets the session state for the current client acacordingly.


### Views
```
├── app/
   ├── views/
     ├── photos/
      ├── create.html.erb
      ├── search.html.erb
      ├── search.json.jbuilder
      ├── show.json.jbuilder
```

The view code is not complex, and is fairly self-explanatory. In a nutshell, the `*.erb` files handle user input and are regular HTML views with some basic [PicoCSS](https://picocss.com/) styling, whilst the `*.jbuilder` files render pure JSON views.

## Potential Improvements
A few ideas for improving the application:
- [ ] Use Ruby namespaces for API versioning
- [ ] Move from SQLite to Postgres database. SQLite runs in memory, and while that is fine for our self-hosted approach, it would not be suitable for production.
- [ ] Use partials for duplicate view logic per DRY coding standards
- [ ] Add integration tests for the view-controller relationship. 
