p @images
if @images.present?
    @images.each_with_index do |image, index|
        json.set! index do
            json.id image['public_id'] 
            json.url image['secure_url']
        end
    end
else
    redirect_to photos_create_path, :notice => "You have no photos to display."
end