class PhotosController < ApplicationController
  protect_from_forgery
  before_action :user_is_logged_in?
  before_action :check_config
  
  # ROOT - SHOW ALL IMAGES
  def show
    list_images
  end

  # UPLOAD - CALLED BY VIEW
  def create
    if params[:path]
      @uploaded = Cloudinary::Uploader.upload(params[:path],:categorization => "google_tagging", :auto_tagging => 0.6)
      p @uploaded  
    end
  end

  # SEARCH - CALLED BY VIEW
  def search
    if params[:query]
      query = params[:query]
      response = Cloudinary::Search.expression(query + ' AND tags= ' + session[:email]).execute
      @images = response['resources']
      p @images
      #TODO: use partials instead
      render 'search.json.jbuilder'
    else
      render 'search.html.erb'
    end
  end

  #HELPER FUNCTIONS
  private
      def check_config
          render 'config incomplete!' if Cloudinary.config.api_key.blank?
      end

      def list_images
          response = Cloudinary::Api.resources_by_tag(session[:email], options={})
          if response
            @images = response['resources']
            #@images.each { |image| p image}
            render 'show.json.jbuilder'
          end
      end
end
