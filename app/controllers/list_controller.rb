# https://cloudinary.com/documentation/admin_api#api_overview
class ListController < ApplicationController

    before_action :check_config
    
    def index
        list_images
    end

    def show
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