class PhotosController < ApplicationController
  protect_from_forgery
  before_action :user_is_logged_in?
  before_action :check_config
  
  def show
    #TODO: uncomment.
    list_images
  end

  def create
    if params[:path]
      @uploaded = Cloudinary::Uploader.upload(params[:path],:categorization => "google_tagging", :auto_tagging => 0.6)
      p @uploaded  
    end
  end

  def search
    if params[:query]
      query = params[:query]
      response = Cloudinary::Search.expression(query + ' AND tags= ' + session[:email]).execute
      @images = response['resources']
      p @images
      #TODO: use partials instead
      render 'show.json.jbuilder'
    end
  end

      def check_config
          render 'config incomplete!' if Cloudinary.config.api_key.blank?
      end

      def list_images
          response = Cloudinary::Api.resources_by_tag(session[:email], options={})
          if response
            @images = response['resources']
            p @images
            render 'show.json.jbuilder'
          end
      end
end
