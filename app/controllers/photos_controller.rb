class PhotosController < ApplicationController
  protect_from_forgery
  before_action :user_is_logged_in?
  before_action :check_config
  
  def index
  end

  def show
    #TODO: uncomment.
    #list_images
    render 'show.json.jbuilder'
  end

  def create
    @uploaded = Cloudinary::Uploader.upload(path,:categorization => "google_tagging", :auto_tagging => 0.6)  
    #TODO
    #:tags => ['a@b.com']
  end

  def search
    if params[:query]
      query = params[:query]
      #p query
      #Cloudinary::Search.expression('Cartoon AND tags=a@b.com').execute
      response = Cloudinary::Search.expression(query + ' AND tags= ' + session[:email]).execute
      @images = response['resources']
      p @images
    end
  end

      def check_config
          render 'config incomplete!' if Cloudinary.config.api_key.blank?
      end

      def list_images
          @images = Cloudinary::Api.resources_by_tag(session[:email], options={})
          p @images
      end
end
