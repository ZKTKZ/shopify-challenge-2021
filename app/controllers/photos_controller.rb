class PhotosController < ApplicationController
  protect_from_forgery
  before_action :user_is_logged_in?
  before_action :check_config
  
  def index
      #list_images
  end

  def create
    @uploaded = Cloudinary::Uploader.upload(path,:categorization => "google_tagging", :auto_tagging => 0.6)  
    #TODO
    #:tags => ['a@b.com']
  end

  def search
    query = JSON.parse(request.raw_post)['query']
    #Cloudinary::Search.expression('Cartoon AND tags=a@b.com').execute
    response = Cloudinary::Search.expression(query + ' AND tags= ' + session[:email]).execute
    @images = response['resources']
  end

  private
      def check_config
          render 'config incomplete!' if Cloudinary.config.api_key.blank?
      end

      def list_images
          #TODO: uncomment below!
          @images = Cloudinary::Api.resources(options={})
      end
end
