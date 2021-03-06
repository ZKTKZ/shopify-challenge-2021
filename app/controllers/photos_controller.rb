class PhotosController < ApplicationController
  protect_from_forgery
  before_action :user_is_logged_in?
  before_action :check_config
  
  # HOMEPAGE - SHOW ALL IMAGES AS JSON
  def show
    list_images
  end

  # UPLOAD LOGIC
  def create
    if params[:path]
      p params[:path]
      @uploaded = Cloudinary::Uploader.upload(params[:path],:categorization => "google_tagging", :auto_tagging => 0.6, :tags => session[:email])
    end
  end

  # SEARCH LOGIC
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
            if @images.present?
              render 'show.json.jbuilder'
            else
              redirect_to photos_create_path
            end
          end
      end
end
