class PhotosController < ApplicationController
  protect_from_forgery
  before_action :check_config
  
  def index
      list_images
  end

  #TODO: add json in corresponding view
  def create
    @uploaded = Cloudinary::Uploader.upload(path,:categorization => "google_tagging", :auto_tagging => 0.6)  
    p @uploaded
  end

  def search
    query = JSON.parse(request.raw_post)['query']
    response = (Cloudinary::Search.expression(query).execute)
    @resources = response['resources']
  end

  #TODO: delete image by... public id?
  def destroy
  end

  private
      def check_config
          render 'config incomplete!' if Cloudinary.config.api_key.blank?
      end

      def list_images
          @images = Cloudinary::Api.resources(options={})
          p @images
      end
end
